Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174872;
	Tue,  1 Jun 2021 20:08:43 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so452983otc.6;
        Tue, 01 Jun 2021 13:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qi22XqSl0TrDeT7OJtpve66CIrtSXS/4y0XrU4sNMf8=;
        b=kKLqG7FIRF/vnyNmIHqGclH4k0bIKzFVQ6+cGHkdO8zWIoprwAX3n/pC2fzBOUN4lF
         n8bgCdzlj+ifmghrTdZBO5mi79ZN0N53nWxYFhW+qdA+/I5O7+jAyXccGIQhTireFkSB
         iwvE5AOqv2oXOqMPYhqus2wM//EcnMGWilkoYhtO1g+DCrJecrdpit3MsqN2C0M6RZgh
         y3LdSD2zYew2jcbtkvQ/HlpNXO/io5hbI+ZF1GhEqN91iLq1HxYFLJ+doo4Sir7R5hFG
         vUgr07Tw9i6MNmjchI6UfZVrT5SBrjyzXHRpp6+I2E/9NN9jCK27bwVGBHR9P9+ovuNk
         yTqg==
X-Gm-Message-State: AOAM531mjIihqCfEBW794lGqIbtUJxVQ13ypn79SlQnQYB1Nn/+8sXat
	NxUeCw70ZAhMfSDDFI0bRA==
X-Google-Smtp-Source: ABdhPJwsZU/or6CWUEiwKckuo2bO7iFo9ZoxKL5tn3ctiTzsWMVsNdMDndWmuAglEtDKtNVTy8YrAw==
X-Received: by 2002:a05:6830:244b:: with SMTP id x11mr22141201otr.151.1622578122539;
        Tue, 01 Jun 2021 13:08:42 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id 35sm4032262oth.49.2021.06.01.13.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 13:08:38 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org,
	users@linux.kernel.org
Subject: [PATCH] Fix cache aging cleanup of threads
Date: Tue,  1 Jun 2021 15:08:35 -0500
Message-Id: <20210601200835.940887-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cache aging for threads was not running resulting in failures to
fetch new messages in threads. Fix the empty cache check which should
be for no '.msgs' directories.

Fixes: 4950093c0c3e ("Don't use mboxo for anything")
Signed-off-by: Rob Herring <robh@kernel.org>
---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index e16ebe6c8a37..c0ff004eb88d 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1882,7 +1882,7 @@ def get_cache_dir(appname: str = 'b4') -> str:
         expmin = 600
     expage = time.time() - expmin
     for entry in os.listdir(cachedir):
-        if entry.find('.mbx') <= 0 and entry.find('.lookup') <= 0 and entry.find('.msgs'):
+        if entry.find('.mbx') <= 0 and entry.find('.lookup') <= 0 and entry.find('.msgs') <= 0:
             continue
         fullpath = os.path.join(cachedir, entry)
         st = os.stat(fullpath)
-- 
2.27.0

