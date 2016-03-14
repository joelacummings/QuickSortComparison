with Ada.Text_IO; use Ada;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Bounded;
with Ada.integer_text_io; use Ada.integer_text_io;
with ada.numerics.elementary_functions; use ada.numerics.elementary_functions;
with Ada.Command_Line; use Ada.Command_Line;

procedure quicksortproc is

  array_size : Integer;
  arrayPos : Integer;
  FileName: String := Ada.Command_Line.Argument(1);
  Integer_File : Text_IO.File_Type;

  type Node;
  type List is access Node;
  type Node is record
    number: Integer;
    next: List;
  end record;
  type testNums is array(Integer range <>) of integer;
  numList: List;

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

    Text_IO.Open(File=>Integer_File, Name=>FileName, Mode=>Text_IO.In_File);
    array_size := 0;

    while (not Text_IO.End_Of_File(Integer_File)) loop
      array_size := array_size + 1;
      numList := new Node'(number=>0, next=>numList);
      Integer_Text_IO.Get(Integer_File, numList.number);

    end loop;

    declare
      nums_array : testNums(0..array_size);
    begin
      arrayPos := 0;
      while (numList.next /= null) loop
        nums_array(arrayPos) := numList.number;
        numList := numList.next;
        arrayPos:= arrayPos + 1;
      end loop;

    quicksort(nums_array, 0, array_size);
    --
    for i in 0..array_size-1 loop
      put_line(Integer'Image(nums_array(i)));
    end loop;

  end;
end quicksortproc;
