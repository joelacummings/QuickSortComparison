with Ada.Text_IO; use Ada.Text_IO;
with Ada.integer_text_io; use Ada.integer_text_io;
with ada.numerics.elementary_functions; use ada.numerics.elementary_functions;

procedure quicksortproc is

  nargs : integer;
  type testNums is array(0..5) of integer;

  numbers: testNums;

  function partition(items: in out testNums; lo: integer; high: integer) return Integer is
    pivot: Integer := items(lo);
    i: Integer := lo - 1;
    j: Integer := high + 1;
    temp: Integer := 0;
  begin


    loop

      loop
        i := i + 1;

        exit when items(i) >= pivot;
      end loop;

      loop
        j := j - 1;

        exit when items(j) <= pivot;
      end loop;

      if (i >= j) then
        return j;
      end if;

      temp := items(i);
      items(i) := items(j);
      items(j) := temp;

    end loop;
  end partition;

  procedure quicksort(items: in out testNums; lo: Integer; high: Integer) is
    p: Integer := 0;
  begin

    if (lo < high) then
      p := partition(items, lo, high);
      quicksort(items, lo, p);
      quicksort(items, p+1, high);
    end if;

  end quicksort;

  -- main
  begin



    numbers(0) := 12;
    numbers(1) := 5;
    numbers(2) := 18;
    numbers(3) := 4;
    numbers(4) := 2;

    quicksort(numbers, 0, 5);

    for i in 0..4 loop
      put_line(Integer'Image(numbers(i)));
    end loop;

end quicksortproc;
