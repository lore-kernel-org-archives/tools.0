Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2228E2;
	Fri, 18 Feb 2022 15:31:40 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id f19so15389095qvb.6;
        Fri, 18 Feb 2022 07:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j2YrH0bLXoPfRw0rcFdDDEcbOHhUEHq40TCQ/Zk0vqc=;
        b=oBMeTvU1IQ7ciJSO2o4rpkDIpnnxhGbztDyRsYo28mboKBeTPMYfC94+urnDDpSbpA
         IBa14z4Rx5YmzUaDTSv+Zv0p/0FUSjzRMxPDayfUCwwknVlwK5NtSNeOakYY8VIWoHoh
         TSuzG52zF7fA+cGvNx6ab6xkrQi4SjNZq+WJjrFrD8YNnDzTBrGbY1YaUhF1FAG53n5P
         88NpzCEFRXnBompKI186wtfVMsPkQFUt33KjArEWiIAJ8RIvwyU6Vbw+wGyqMFgcF2DE
         XKp/eClHyEtuslFlYJvmaF6jggq0A3/XLnnXx+Qio3dI6XIiaNdob1mjYW3TtrkjZAMi
         Bh3g==
X-Gm-Message-State: AOAM530jmj8OCoNLGmaZiXAGQyhBGn9WoKqzLWFICG/WSiheVvKG1MwA
	H+ol/PV8/MX4raLRu1MSaLg=
X-Google-Smtp-Source: ABdhPJxV+iWf7xtvD6CiviNVOCPaNoyuLhKjpniINoSyn8KCeoEXMuI8XhXzScIoF0DaXT5HBw0Tww==
X-Received: by 2002:a0c:c2cf:0:b0:42c:3b31:86ba with SMTP id c15-20020a0cc2cf000000b0042c3b3186bamr6075781qvi.127.1645198299215;
        Fri, 18 Feb 2022 07:31:39 -0800 (PST)
Received: from localhost (fwdproxy-ash-001.fbsv.net. [2a03:2880:20ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id x16sm22085934qko.17.2022.02.18.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 07:31:38 -0800 (PST)
From: David Vernet <void@manifault.com>
To: konstantin@linuxfoundation.org
Cc: users@linux.kernel.org,
	tools@linux.kernel.org,
	void@manifault.com,
	kernel-team@fb.com
Subject: [PATCH 1/2] man: Update man page to mention HTTPS_PROXY
Date: Fri, 18 Feb 2022 07:31:27 -0800
Message-Id: <20220218153128.914071-1-void@manifault.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118210808.2158914-1-void@manifault.com>
References: <20220118210808.2158914-1-void@manifault.com>
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

