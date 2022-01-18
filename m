Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081429CA;
	Tue, 18 Jan 2022 21:08:30 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id z10so505748qkf.7;
        Tue, 18 Jan 2022 13:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j2YrH0bLXoPfRw0rcFdDDEcbOHhUEHq40TCQ/Zk0vqc=;
        b=2D3zd//7pAjhcnckhP79bIVZhLSCK0za0u6LCtWiWG8GqiU7zcDjo6uAkBgMQElfDk
         MzpSfPVfqUuswVXWCwGoVAKB3LEEN7iRUJPU5QSLvsFDnygCkH7MsJpgDgf10cpT558o
         MLk5EGssJxuocAm8xi9PAN4oby5LwmFhuPnO/ZdE/dapo15e3hQ/JS9x5DE37lfIjr+h
         /BnyhoX3gkJdWNMnSmONyMCXUZNQ7lbFLE3D5tkiC3O0O9fuaY+RkrkcJ3D00uf0h4q0
         SgmZi6IVMEifyzss4qZa2Gma3OdNwYv7gQPSygcY36U56+WxeauqOLzel5dabUVI4SF+
         e4pA==
X-Gm-Message-State: AOAM530eXC8kY5gr9ZkwjUX305rRlmdF13vV7MzzRUEMz+zKHFdRXg6y
	2C1jnheeoBYunpL2wNUpnjY=
X-Google-Smtp-Source: ABdhPJz2QBh/xxVFyg1RemZimnVaoLhTXnfjPkqTMak1sEfbeOBXSjNZeZJo5Yzjf1oas6Y2pXTZsg==
X-Received: by 2002:a05:620a:4150:: with SMTP id k16mr417692qko.265.1642540109546;
        Tue, 18 Jan 2022 13:08:29 -0800 (PST)
Received: from localhost (fwdproxy-ash-001.fbsv.net. [2a03:2880:20ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id d17sm11458616qtx.96.2022.01.18.13.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 13:08:29 -0800 (PST)
From: David Vernet <void@manifault.com>
To: konstantin@linuxfoundation.org
Cc: users@linux.kernel.org,
	tools@linux.kernel.org,
	void@manifault.com,
	kernel-team@fb.com
Subject: [PATCH 1/2] man: Update man page to mention HTTPS_PROXY
Date: Tue, 18 Jan 2022 13:08:08 -0800
Message-Id: <20220118210808.2158914-1-void@manifault.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Certain b4 commands may send requests to https://lore.kernel.org, such
as to fetch a thread of patches as an mbox file. b4 internally uses the
python-requests library to perform these requests, and thus the requests
may be proxied by setting the HTTPS_PROXY environment variable.

The fact that b4 uses the python-requests library is an implementation
detail, so this diff adds a small 'PROXYING REQUESTS' section to the man
page that informs the user that they may use the HTTPS_PROXY environment
variable to enable proxying.

Link: https://lore.kernel.org/all/20220118174144.2445150-1-void@manifault.com/
Signed-off-by: David Vernet <void@manifault.com>
---
 man/b4.5.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/b4.5.rst b/man/b4.5.rst
index 19e96af..ab12804 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -321,6 +321,12 @@ Default configuration, with explanations::
       # Used when preparing merge messages from cover letters. See shazam-merge-template.example
       shazam-merge-template = None
 
+PROXYING REQUESTS
+-----------------
+Commands making requests to lore may be configured to proxy those requests
+by setting the **HTTPS_PROXY** environment variable, as described in
+https://docs.python-requests.org/en/latest/user/advanced/#proxies.
+
 SUPPORT
 -------
 Please email tools@linux.kernel.org with support requests,
-- 
2.30.2

