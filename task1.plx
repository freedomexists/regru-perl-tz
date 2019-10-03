#!/usr/bin/perl
use strict;

sub partition {
    my ($arr, $low, $high) = @_;
    my $pivot = $$arr[$high];
    my $i = $low - 1;
    for my $j ($low..$high-1) {
        if ($$arr[$j] <= $pivot) {
            $i++;
            @$arr[$i, $j] = @$arr[$j, $i];
        }
    }
    $i++;
    @$arr[$i, $high] = @$arr[$high, $i];
    return $i
}

sub quick_sort {
    my ($arr, $low, $high) = @_;
    if ($low < $high) {
        my $p = partition($arr, $low, $high);
        quick_sort($arr, $low, $p - 1);
        quick_sort($arr, $p + 1, $high);
    }
    
}


sub search {
    my ($arr, $wanted, $low, $high) = @_;
    my ($mid);
    while ($low <= $high) {
        $mid = int(($high + $low) / 2);
        if ($wanted == $$arr[$mid]) {
            return "MATCH"
        }
        elsif ($wanted > $$arr[$mid]) {
            $low = $mid + 1;
        }
        else {
            $high = $mid - 1
        }
    }
    return "NOT_MATCH"
}


my @unsorted = qw/7 1 3 4 2 4 6 5 5/;
quick_sort(\@unsorted, 0, $#unsorted + 1);
my $wanted = <STDIN>;
my $result = search(\@unsorted, $wanted, 0, $#unsorted);
print "$result"
