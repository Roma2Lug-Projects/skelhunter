#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  skelhunter.py
#  
#  Copyright 2016 Emanuele Savo <tucs@Noctua>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
import sys
import os

def main(args):
	comandi = ["client", "initclient", "server", "initserver"]

	print command
	
	if os.geteuid() != 0:
		print("\n\t[ERR]\tSkelhunter needs root permissions. \n\n\t\t<<Perché io so' io>> - March. Onofrio Del Grillo\n")
		return 1
		
	if (len(sys.argv) != 1) or (command not in comandi):
		print("\n[ERR]\tInvoke as ./skelhunter.py {client|initclient|server|initserver}")
		return 1	
		
	command = str(sys.argv[1])
    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv))
