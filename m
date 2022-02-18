Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF5B48A4;
	Fri, 18 Feb 2022 15:31:42 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id d3so15349696qvb.5;
        Fri, 18 Feb 2022 07:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRz4CB6pkMlzULjNPyL5owVc3Og4a0YXE3ZrrN2c6HA=;
        b=HzxL1iLILUT4gcSO5sU4BOAixcn6eJ6T2MT/qIcC3jRLhx+BaebIdEBvJKcNpl8cZJ
         Vqc+5FbLyotb8P0dTWiKqdVWnf86S4jF4PBLCsAz01IsxgiLPmZVMWvGmgZM5pY5xRCS
         2iJshxQFa+PY2BLbyNoKjO++908uebTt5KTKnro4etUUXclMQL7NSJ3Qk8CHd6n92hRf
         7dZfpjHDzqAPAC7W+hWioWTU7hiw3/b94plDyzNc/NovWf3S8wuCRMcBswkRmxpc3ybV
         Zn/MKa6VRCx4Y/Z9NlDv8hAlfGDfYSithTHLeuxLoJQYyy1mMxvjgyEc1mFeZ1mdp9a9
         vfdw==
X-Gm-Message-State: AOAM531xnc+jmkMesEzXVkxixVaQ0CcIf1uUc4WyuOBDLlrmf+Pvs+mo
	vaWzq0X+DJIqYHAwShkidbJmEXA+B3RiJA==
X-Google-Smtp-Source: ABdhPJwjJi726oY9impIjT3Wv0T8wQZMw6kmDXwJDhYOg71LLSvxBkS5N4CwLBPqu/yj+/LzQKsaJg==
X-Received: by 2002:ad4:4e61:0:b0:42d:1b44:44c4 with SMTP id ec1-20020ad44e61000000b0042d1b4444c4mr6054053qvb.44.1645198301719;
        Fri, 18 Feb 2022 07:31:41 -0800 (PST)
Received: from localhost (fwdproxy-ash-006.fbsv.net. [2a03:2880:20ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id az38sm22022541qkb.124.2022.02.18.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 07:31:41 -0800 (PST)
From: David Vernet <void@manifault.com>
To: konstantin@linuxfoundation.org
Cc: users@linux.kernel.org,
	tools@linux.kernel.org,
	void@manifault.com,
	kernel-team@fb.com
Subject: [PATCH 2/2] man: Update man page to use bold where appropriate
Date: Fri, 18 Feb 2022 07:31:28 -0800
Message-Id: <20220218153128.914071-2-void@manifault.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218153128.914071-1-void@manifault.com>
References: <20220118210808.2158914-1-void@manifault.com>
 <20220218153128.914071-1-void@manifault.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

According to https://man7.org/linux/man-pages/man1/man.1.html, when writing
a man page for a program, anything that should be typed exactly as shown
should use bolded text. The b4 man page has a SUBCOMMANDS section where
subcommands are listed as 'b4 <subcommand>', in italics. So as to match the
guidance for man pages (as well as to match the examples provided at the
link above), this diff updates the 'b4' portion of the aforementioned
subcommand section to be bolded.

Signed-off-by: David Vernet <void@manifault.com>
---
 man/b4.5.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/man/b4.5.rst b/man/b4.5.rst
index ab12804..b45909a 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -27,14 +27,14 @@ precursor to Lore and Data in the Star Trek universe.
 
 SUBCOMMANDS
 -----------
-* *b4 mbox*: Download a thread as an mbox file
-* *b4 am*: Create an mbox file that is ready to git-am
-* *b4 shazam*: Similar to *am*, but lets you apply patches directly
-* *b4 pr*: Work with pull requests
-* *b4 diff*: Show range-diff style diffs between patch versions
-* *b4 ty*: Create templated replies for processed patches and pull requests
-* *b4 attest*: (EXPERIMENTAL) Add cryptographic attestation to patches
-* *b4 kr* (EXPERIMENTAL) Operate on patatt-compatible keyrings
+* **b4** *mbox*: Download a thread as an mbox file
+* **b4** *am*: Create an mbox file that is ready to git-am
+* **b4** *shazam*: Similar to *am*, but lets you apply patches directly
+* **b4** *pr*: Work with pull requests
+* **b4** *diff*: Show range-diff style diffs between patch versions
+* **b4** *ty*: Create templated replies for processed patches and pull requests
+* **b4** *attest*: (EXPERIMENTAL) Add cryptographic attestation to patches
+* **b4** *kr* (EXPERIMENTAL) Operate on patatt-compatible keyrings
 
 OPTIONS
 -------
-- 
2.30.2

