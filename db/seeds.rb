Category.create!([
  {name: "Audio and Video", description: "Cables, adapters, monitors, and other audio visual equipment", loan_length_seconds: 172800},
  {name: "Peripherals, Adapters, and Miscellaneous Items", description: "Mice, keyboards, monitors, disk drives, and power cables", loan_length_seconds: 172800},
  {name: "Software and Operating Systems", description: "Microsoft Office, Windows, and Linux", loan_length_seconds: 172800},
  {name: "Networking", description: "Ethernet cables, adapters, and wifi equipment", loan_length_seconds: 259200},
  {name: "Tools", description: "Screwdrivers, wrenches, pliers, and miscellaneous tools", loan_length_seconds: 172800},
  {name: "Loaner Computers", description: "Computer for short and long term checkout", loan_length_seconds: 259200},
  {name: "Media and Media Readers", description: "USB flash drives, hard drives, blank CD's/DVD/s, etc., Optical Readers", loan_length_seconds: 259200}
])
Notice.create!([
  {name: "Wired Network Registration", text: "To connect new computers (or computers that have changed rooms) to the DCO wired network, you must notify DCO. We will update our database with the information you provide."},
  {name: "Microsoft Notice", text: "Microsoft Software, per our license agreement with Microsoft, may only be installed on machines purchased with University of Michigan or Departmental funds. This software must not be duplicated."}
])
Office.create!([
  {name: "2917 BBB", address: "Departmental Computing Organization\r\n2917 Bob and Betty Beyster Building\r\n2260 Hayward St\r\nAnn Arbor, MI 48109"},
  {name: "4403 EECS", address: "Departmental Computing Organization\r\n4403 Electrical Engineering and Computer Science Building\r\n1301 Beal Ave\r\nAnn Arbor, MI, 48109"}
])
Title.create!([
  {category_id: 2, name: "Laptop Power Supply", description: "Power supply (a la carte, i.e. not checked out in addition to a laptop)", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: "Apple (MagSafe)\nDell\nHP\nLenovo\nOther"},
  {category_id: 1, name: "USB Hub", description: "Used to connect multiple USB devices to a single USB port on a computer.", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 1, name: "Video Cable", description: "Digital video cable used to connect computers to displays. Please specify the type (e.g. VGA to VGA or HDMI to DVI)", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 7, name: "Optical (CD/DVD) Disk Drive", description: "A disk drive capable of reading and/or writing to CD's and/or DVD's", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
 {category_id: 4, name: "USB Ethernet Adapter", description: "Used to connect computers (usually laptops) that have no ethernet ports to wired networks.", n_available: nil, loan_length_seconds: 172800, notice_id: 1, office_id: nil, enabled: true, options_str: "USB\nThunderBolt"},
  {category_id: 2, name: "Mouse", description: "Not the kind that goes squeak!", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 2, name: "Keyboard", description: "typetypetype", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 3, name: "Microsoft Windows", description: "Windows", n_available: nil, loan_length_seconds: 172800, notice_id: 2, office_id: nil, enabled: true, options_str: "Windows 10 - USB\nWindows 10 - DVD\nWindows 8 - USB\nWindows 8 - DVD\nWindows 7 - USB\nWindows 7 - DVD"},
  {category_id: 3, name: "Microsoft Office", description: "Microsoft Office. DCO may be able to install this on your computer remotely (be sure to ask).", n_available: nil, loan_length_seconds: 172800, notice_id: 2, office_id: nil, enabled: true, options_str: "2016\n2013"},
  {category_id: 3, name: "Apple macOS", description: "This software is subject to licensing restrictions.", n_available: nil, loan_length_seconds: 172800, notice_id: 2, office_id: nil, enabled: true, options_str: "2016\n2013"},
  {category_id: 3, name: "Miscellaneous Software", description: "Please leave a description of the software (and the install media type) in the note field.", n_available: nil, loan_length_seconds: 172800, notice_id: 2, office_id: nil, enabled: true, options_str: "2016\n2013"},
  {category_id: 2, name: "Power Strip", description: "Power strip", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 5, name: "Hand Tool", description: "Please give a description of the tool in the note field.", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 3, name: "Ubuntu Linux Installation Media", description: "Ubuntu Linux 16.04 Xenial Xerus", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: "USB Installed\nDVD Installer"},
  {category_id: 3, name: "RedHat Linux Installation Media", description: "RedHat Linux 7", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: "USB Installer\nDVD Installer"},
  {category_id: 3, name: "Miscellaneous Linux Installation Media", description: "Please leave the Linux Distribution in the note field.", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: "USB Installer\nDVD Installer"},
  {category_id: 6, name: "Dell Studio 1558", description: "Laptop available for short term or long term loan. Can be loaded with Linux or Windows.\n\nIntel Core i3, 2.27 GHz\r\n4GB RAM", n_available: 2, loan_length_seconds: 259200, notice_id: nil, office_id: 1, enabled: true, options_str: "Aquarius (Service Tag F965BM1)\nCapricorn (Service Tag JNVJYL1)"},
  {category_id: 6, name: "HP ProBook", description: "Laptop available for short term or long term loan. Can be loaded with Linux or Windows.", n_available: nil, loan_length_seconds: 259200, notice_id: nil, office_id: 1, enabled: true, options_str: ""},
  {category_id: 6, name: "Tablet Computer", description: "Tablet available for short term loan.", n_available: nil, loan_length_seconds: 259200, notice_id: nil, office_id: nil, enabled: true, options_str: "iPad\nSurface 2"},
  {category_id: 2, name: "Book", description: "A DCO owned book. Please specify the title of the book in the note field.", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 2, name: "Monitor", description: "Please leave a description of the monitor make and model in the note field.", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 2, name: "Projector", description: "Please leave a description of the projector make and model in the note field.", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 4, name: "Ethernet Switch", description: "A switch to connect multiple computers", n_available: nil, loan_length_seconds: 259200, notice_id: nil, office_id: nil, enabled: true, options_str: "TRENDnet 5 Port\nTRENDnet 8 Port\nOther"},
  {category_id: 4, name: "WiFi Router", description: "Connect wireless devices", n_available: nil, loan_length_seconds: 259200, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 2, name: "USB Hard Drive Adapter", description: "A USB adapter to connect SATA or IDE hard drives", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: "Dock Style (hard drive fits inside)\nAdapter Style (like one long cable)"},
  {category_id: 7, name: "SATA Hard Drive", description: "SATA Hard Drive (usually used inside of computers)", n_available: nil, loan_length_seconds: 259200, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 7, name: "USB Hard Drive", description: "External USB Hard Drive (useful for backups)", n_available: nil, loan_length_seconds: 259200, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 7, name: "USB Flash Drive", description: "USB Flash Drive", n_available: nil, loan_length_seconds: 259200, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 1, name: "Video Adapter", description: "Please specify the type in the note field.", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 2, name: "Miscellaneous Accessory", description: "Miscaellaneosuasifjas accesorry ", n_available: nil, loan_length_seconds: 172800, notice_id: nil, office_id: nil, enabled: true, options_str: ""},
  {category_id: 6, name: "Lenovo G50", description: "Lenovo G50", n_available: nil, loan_length_seconds: 259200, notice_id: nil, office_id: nil, enabled: true, options_str: ""}
])
