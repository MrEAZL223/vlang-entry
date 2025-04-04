module entry_runtime

pub enum Headache {
	wtf
	todo
}

struct Entry {
pub mut:
	sandwich [256]int
	pizza_slicer usize
	direction bool
	skip bool
}

pub fn go(code string) Headache {
	mut entry := Entry{}
	mut index := 0

	for {
		index++
		if index > code.len {
			break
		}

		for i in 0..6 {
			match i {
				0 {
					match code[0..1] {
						'>' {
							if entry.skip {
								entry.skip = false
							} else {
								entry.pizza_slicer++
								if entry.pizza_slicer >= 256 {entry.pizza_slicer = 0}
							}
							break
						}
						'<' {
							if entry.skip {
								entry.skip = false
							} else {
								if entry.pizza_slicer == 0 {entry.pizza_slicer = 256}
								entry.pizza_slicer--
							}
							break
						}
						else {}
					}
				}
				1 {
					match code[0..2] {
						"if" {
							if entry.skip {
								entry.skip = false
							} else {
								entry.skip = entry.pizza_slicer != 0
							}
							break
						}
						else {}
					}
				}
				2 {
					match code[0..3] {
						"add" {
							if entry.skip {
								entry.skip = false
							} else {
								entry.sandwich[entry.pizza_slicer]++
							}
							break
						}
						"dec" {
							if entry.skip {
								entry.skip = false
							} else {
								entry.sandwich[entry.pizza_slicer]--
							}
							break
						}
						"rev" {
							if entry.skip {
								entry.skip = false
							} else {
								entry.direction = !entry.direction
							}
							break
						}
						"nfi" {
							if entry.skip {
								entry.skip = false
							} else {
								entry.skip = entry.sandwich[entry.pizza_slicer] == 0
							}
							break
						}
						else {}
					}
				}
				4 {
					match code[0..5] {
						"print" {
							if entry.skip {
								entry.skip = false
							} else {
								c := entry.sandwich[entry.pizza_slicer];
								if c >= 256 {
									return Headache.wtf
								}

								print(c)
							}
							break
						}
						"ftext" {
							if entry.skip {
								entry.skip = false
							} else {
								if entry.pizza_slicer == 0 {entry.pizza_slicer = 256}
								entry.pizza_slicer--
							}
							break
						}
						else {}
					}
				}
				else {}
			}
		}

		index += if entry.direction {-1} else {1}
	}

	return Headache.todo
}