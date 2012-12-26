include theos/makefiles/common.mk

TWEAK_NAME = ShowHideRecipients
ShowHideRecipients_FILES = Tweak.xm
ShowHideRecipients_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
