#
# This project constructs ALFA-Campaign core resources.
#

!include $(PROJECT_SOURCE_ROOT)\makefile.def

all:
	@copy /y Campaign.cam $(OUTPUTDIR)\ >NUL
	@copy /y campaigndownloaderresources.xml $(OUTPUTDIR)\ >NUL
	@copy /y module.jrl $(OUTPUTDIR)\ >NUL

clean:
	@if exist $(OUTPUTDIR)\Campaign.cam del $(OUTPUTDIR)\Campaign.cam
	@if exist $(OUTPUTDIR)\campaigndownloaderresources.xml del $(OUTPUTDIR)\campaigndownloaderresources.xml
	@if exist $(OUTPUTDIR)\module.jrl del $(OUTPUTDIR)\module.jrl