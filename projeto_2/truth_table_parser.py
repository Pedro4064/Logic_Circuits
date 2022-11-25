def get_file(file_name: str) -> str:
    with open(file_name, 'r') as data_file:
        return data_file.readlines()

def parse_file(data: list) -> list:
    parsed_data = []
    for line in data:
        parsed_data.append(line.strip().replace(' ', '').replace('H', '1').replace('L', '0'))

    return parsed_data


def generate_test_bench(template:str) -> str:
    ...

if __name__ == '__main__':
    raw_data = get_file('truth_table.txt')
    parsed_data = parse_file(raw_data)

    template = """ 
        a_in <= "{a_in}";
        e_in <= "{e_in}";
        wait for 1 ns;
        assert(o_in="{o_in}") report "Erro na Entrada {a_in}/{e_in}" severity error;

    """

    for data_entry in parsed_data:
        o = data_entry[6:][::-1]
        o = ''.join(['1' if bit == '0' else '0' for bit in o])
        print(template.format(e_in = data_entry[0:3][::-1], a_in = data_entry[3:6][::-1], o_in = o))
