import matplotlib.patches as patches
import matplotlib.pyplot as plt
import numpy as np

from .utils import fig2data


def get_objects_from_obs(obs):
    on_links = {}
    pile_bottoms = set()
    all_objs = set()
    holding = None
    for lit in obs:
        if lit.predicate.name.lower() == "ontable":
            pile_bottoms.add(lit.variables[0])
            all_objs.add(lit.variables[0])
        elif lit.predicate.name.lower() == "on":
            on_links[lit.variables[1]] = lit.variables[0]
            all_objs.update(lit.variables)
        elif lit.predicate.name.lower() == "holding":
            holding = lit.variables[0]
            all_objs.add(lit.variables[0])
    all_objs = sorted(all_objs)

    bottom_to_pile = {}
    for obj in pile_bottoms:
        bottom_to_pile[obj] = [obj]
        key = obj
        while key in on_links:
            assert on_links[key] not in bottom_to_pile[obj]
            bottom_to_pile[obj].append(on_links[key])
            key = on_links[key]

    piles = []
    for pile_base in all_objs:
        if pile_base in bottom_to_pile:
            piles.append(bottom_to_pile[pile_base])
        else:
            piles.append([])

    return piles, holding


def get_block_params(piles, holding, width, height, table_height, robot_height):
    # num_blocks = len(piles)
    # horizontal_padding = 0.025 * width
    # block_width = width / num_blocks - 2 * horizontal_padding
    # block_height = (height - table_height - robot_height) / num_blocks - 0.05 * height

    # block_positions = {}
    # for pile_i, pile in enumerate(piles):
    #     x = horizontal_padding + pile_i * (block_width + 2 * horizontal_padding)
    #     for block_i, name in enumerate(pile):
    #         y = table_height + block_i * block_height
    #         block_positions[name] = (x, y)

    num_blocks = len(piles)
    horizontal_padding = 0.025 * width
    block_width = width / num_blocks - 2 * horizontal_padding
    block_height = (height - table_height - robot_height) / num_blocks - 0.05 * height

    block_width_offset = 0.05 * block_width
    block_names = [name for pile in piles for name in pile if len(pile) > 0]
    if holding is not None:
        block_names.append(holding)
    block_names = sorted(block_names, key=lambda s: int(s._str.split(":")[0][1:]), reverse=True)
    block_width_offset_dct = {}
    for i, block_name in enumerate(block_names):
        if holding is not None and block_name == holding:
            continue
        block_width_offset_dct[block_name] = i * block_width_offset

    block_positions = {}
    for pile_i, pile in enumerate(piles):
        x = horizontal_padding + pile_i * (block_width + 2 * horizontal_padding)
        for block_i, name in enumerate(pile):
            y = table_height + block_i * block_height
            # x = x + block_width_offset_dct[name]
            block_positions[name] = (x + block_width_offset_dct[name], y)

    return block_width, block_height, block_positions, block_width_offset_dct


def draw_table(ax, width, table_height):
    rect = patches.Rectangle((0, 0), width, table_height, linewidth=1, edgecolor=(0.2, 0.2, 0.2), facecolor=(0.5, 0.2, 0.0))
    ax.add_patch(rect)


def draw_robot(ax, robot_width, robot_height, midx, midy, holding, block_width, block_height):
    x = midx - robot_width / 2
    y = midy - robot_height / 2
    rect = patches.Rectangle(
        (x, y), robot_width, robot_height, linewidth=1, edgecolor=(0.2, 0.2, 0.2), facecolor=(0.4, 0.4, 0.4)
    )
    ax.add_patch(rect)

    # Holding
    if holding is None:
        holding_color = (1.0, 1.0, 1.0)
        ec = (0.0, 0.0, 0.0, 0.0)
    else:
        holding_color = block_name_to_color(holding)
        ec = (0.2, 0.2, 0.2)
    holding_x = midx - block_width / 2
    holding_y = y - block_height / 3
    rect = patches.Rectangle(
        (holding_x, holding_y), block_width, block_height, linewidth=1, edgecolor=ec, facecolor=holding_color
    )
    ax.add_patch(rect)


_block_name_to_color = {}
_rng = np.random.RandomState(0)


def block_name_to_color(block_name):
    if block_name not in _block_name_to_color:
        if len(_block_name_to_color) == 0:
            best_color = (0.9, 0.1, 0.1)
        else:
            # Generate 20 random colors and keep the one most different from prior colors
            best_color = None
            max_min_color_diff = 0.0
            for _ in range(20):
                color = _rng.uniform(0.0, 1.0, size=3)
                min_color_diff = np.inf
                for existing_color in _block_name_to_color.values():
                    diff = np.sum(np.subtract(color, existing_color) ** 2)
                    min_color_diff = min(diff, min_color_diff)
                if min_color_diff > max_min_color_diff:
                    best_color = color
                    max_min_color_diff = min_color_diff
        _block_name_to_color[block_name] = best_color
    return _block_name_to_color[block_name]


def draw_blocks(ax, block_width, block_height, block_positions, block_width_offset_dct):
    # n_blocks = len(block_positions)
    # quantile_width_arr = np.linspace(0, block_width, n_blocks + 1)[1:]
    # for (block_name, (x, y)), block_quantile_width in zip(block_positions.items(), quantile_width_arr):
    #     color = block_name_to_color(block_name)
    #     rect = patches.Rectangle(
    #         (x, y), block_quantile_width, block_height, linewidth=1, edgecolor=(0.2, 0.2, 0.2), facecolor=color
    #     )
    #     ax.add_patch(rect)

    for block_name, (x, y) in block_positions.items():
        color = block_name_to_color(block_name)
        rect = patches.Rectangle(
            (x, y),
            block_width - 2 * block_width_offset_dct[block_name],
            block_height,
            linewidth=1,
            edgecolor=(0.2, 0.2, 0.2),
            facecolor=color,
        )
        ax.add_patch(rect)


def render(obs, mode="human", close=False):

    width, height = 3.2, 1.8
    fig = plt.figure(figsize=(4.2, 2.0))
    ax = fig.add_axes(
        (0.0, 0.0, 1.0, 1.0), aspect="equal", frameon=False, xlim=(-0.05, width + 0.05), ylim=(-0.05, height + 0.05)
    )
    for axis in (ax.xaxis, ax.yaxis):
        axis.set_major_formatter(plt.NullFormatter())
        axis.set_major_locator(plt.NullLocator())

    table_height = height * 0.15
    robot_height = height * 0.1

    piles, holding = get_objects_from_obs(obs)
    block_width, block_height, block_positions, block_width_offset_dct = get_block_params(
        piles, holding, width, height, table_height, robot_height
    )
    # block_width_offset_dct.remove()
    robot_width = block_width * 1.4
    robot_midx = width / 2
    robot_midy = height - robot_height / 2

    draw_table(ax, width, table_height)
    draw_blocks(ax, block_width, block_height, block_positions, block_width_offset_dct)
    draw_robot(ax, robot_width, robot_height, robot_midx, robot_midy, holding, block_width, block_height)

    return fig2data(fig)
