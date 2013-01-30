#
# This project constructs core ALFA-Campaign resources.
#

!include $(PROJECT_SOURCE_ROOT)\makefile.def

all:
	@copy /y *.* $(OUTPUTDIR)\ >NUL
	@if exist $(OUTPUTDIR)\makefile del $(OUTPUTDIR)\makefile

clean:
	@if exist $(OUTPUTDIR)\Campaign.cam del $(OUTPUTDIR)\Campaign.cam
	@if exist $(OUTPUTDIR)\campaigndownloaderresources.xml del $(OUTPUTDIR)\campaigndownloaderresources.xml
	@if exist $(OUTPUTDIR)\module.jrl del $(OUTPUTDIR)\module.jrl