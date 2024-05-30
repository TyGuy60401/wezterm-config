from PIL import Image
import sys

def main(argv):
    fin_name = argv[1] if len(argv) > 1 else 'img_in.png'
    fout_name = argv[2] if len(argv) > 2 else 'img_out.png'
    position = argv[3] if len(argv) > 3 else 'center'
    position = position if position in ['top', 'bottom', 'center', 'left', 'right'] else 'center'

    img = Image.open(fin_name)
    aspect = img.size[0] / img.size[1]
    print(aspect)


    x_proportion = max(aspect / (16/9), 1)
    y_proportion = min(aspect / (16/9), 1)

    new_width = int(img.size[0] * x_proportion)
    new_height = int(img.size[1] * y_proportion)

    left = 0
    top = 0

    x_diff = img.size[0] - new_width
    y_diff = img.size[1] - new_height

    if position == 'center':
        left = int(x_diff / 2)
        top = int(y_diff / 2)
    elif position == 'bottom':
        top = y_diff
    elif position == 'right':
        left = x_diff

    crop = (left, top, left + new_width, top + new_height)

    print(img.size)
    # print((new_x, new_y))

    img_cropped = img.crop(crop)
    img_cropped = img_cropped.resize((1920, 1080))
    img_cropped.save(fout_name)


if __name__ == "__main__":
    main(sys.argv)
