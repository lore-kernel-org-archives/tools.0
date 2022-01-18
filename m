Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABD2C9C;
	Tue, 18 Jan 2022 17:42:46 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id k4so2213874qvt.6;
        Tue, 18 Jan 2022 09:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5eBHluvzXcj/AIqJ40DDWEZftNCrB/bne0bamhrZjCM=;
        b=s9vRuuL92J/tmQ3wVNcKBlc0t9lqBSWstFLNxCh2PCIlrBxqlRNH6Y0wsows01tyPU
         tfSUPZ4Vyf2lH8CZdE/5J2WyCKgkJSzbbrVDSEBb7wtqkZGgHD49P2uIWgEZQx4tzAhw
         wsiZVU/HJ2b7JZHUwfC6Km01OGJOzoGsn1berCLUeGnF+B7oXL8sBXoIYmym0jRerhUK
         LRA8g+M29YYUsI1K2lkYUJSfiOEttJKk1R+4HMinYIhiC8x/UxWYTFx2Oq24H4gVUEPg
         Ta3BK9Hi/BMCNDFXosDVdsRwLRxl/AGOEntbxdryumnh5i/doJydC1ebJDSsKkN7HqUV
         6KQA==
X-Gm-Message-State: AOAM53121GMFgmvGiVOr1r5fLK5BbZIERo8Tvw4pm8+bShVh8NGkjxhw
	texaAW8sdFUtOivxerGEP1ntFO/YX7E=
X-Google-Smtp-Source: ABdhPJzQhoaSSoZNW2hMlqhqrWmaNPrornoWxvbUVME4yuTxaYob7BtvorKgZR2trTeywS+soWGiXg==
X-Received: by 2002:a05:6214:762:: with SMTP id f2mr12721284qvz.57.1642527765359;
        Tue, 18 Jan 2022 09:42:45 -0800 (PST)
Received: from localhost (fwdproxy-ash-020.fbsv.net. [2a03:2880:20ff:14::face:b00c])
        by smtp.gmail.com with ESMTPSA id m7sm4076290qkn.112.2022.01.18.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 09:42:45 -0800 (PST)
From: David Vernet <void@manifault.com>
To: konstantin@linuxfoundation.org
Cc: users@linux.kernel.org,
	tools@linux.kernel.org,
	void@manifault.com
Subject: [PATCH] mbox: Add support for proxied https connections
Date: Tue, 18 Jan 2022 09:41:45 -0800
Message-Id: <20220118174144.2445150-1-void@manifault.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The mbox subsystem uses the python requests library to fetch a thread from
lore.kernel.org, by its message ID. This is extremely convenient, but
unfortunately doesn't work for users who must redirect their http(s)
traffic through a proxy to access the internet.

This diff therefore adds support for querying 'http.proxy' from their git
config, and when set, passing that as a proxy entry to the underlying
session requests object.

Signed-off-by: David Vernet <void@manifault.com>
---
 b4/__init__.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/b4/__init__.py b/b4/__init__.py
index 11c287e..0526a19 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -138,6 +138,8 @@ DEFAULT_CONFIG = {
 MAIN_CONFIG = None
 # This is git-config user.*
 USER_CONFIG = None
+# This is git-config http.*
+HTTP_CONFIG = None
 
 # Used for storing our requests session
 REQSESSION = None
@@ -2101,12 +2103,21 @@ def get_user_config():
             USER_CONFIG['name'] = udata.pw_gecos
     return USER_CONFIG
 
+def get_http_config():
+    global HTTP_CONFIG
+    if HTTP_CONFIG is None:
+        HTTP_CONFIG = get_config_from_git(r'http\..*')
+    return HTTP_CONFIG
 
 def get_requests_session():
     global REQSESSION
     if REQSESSION is None:
         REQSESSION = requests.session()
         REQSESSION.headers.update({'User-Agent': 'b4/%s' % __VERSION__})
+        http_config = get_http_config()
+        if 'proxy' in http_config:
+            REQSESSION.proxies.update({'https': http_config['proxy']})
+
     return REQSESSION
 
 
-- 
2.30.2

