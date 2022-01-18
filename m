Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE32CA5;
	Tue, 18 Jan 2022 21:08:36 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id jr5so595441qvb.11;
        Tue, 18 Jan 2022 13:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRz4CB6pkMlzULjNPyL5owVc3Og4a0YXE3ZrrN2c6HA=;
        b=iKj12c7fUqDiYTFVjIij7IpQWvuE98jZGwiI0+78VBxDomwk23Wb7Xv8E8JZ20misZ
         k7Av0TGYxjLFZs98OJix6GDn9h8+jxxVIoqUkaqWxapVJX8S96N+uaWdNMBJelF5SwQQ
         HPeJxwk5dcieBavHMxaSWH67r2brnhbXQSfrPgew8+mBWL96c2Pnd7nXptel3RAxUXhc
         JZNpre0HxMWRkYCoKSd6Suzy0Kp0WZ4+FBEHv8OZPSS3WMRDnOk5yy8/q9hmrJFPx7dd
         Vgm6RW/8TnPtFDkFEA0rvMbHXAvZG/GIsDE75RrFJpLYYSRX0pe8hJTNtdXLctbbJmxC
         r7fQ==
X-Gm-Message-State: AOAM533Gh3849pcIOMVk9+YnD9cscpC77nKlITlL7nzN4y2HS7qyMgzc
	dluBDrt9obiJKmGplJuvKh6EA0B38ns=
X-Google-Smtp-Source: ABdhPJxtQJ7i3C45evAYc/ipMgdjNhOYrB5/Oyhe9FAx+SehPvKJ8FJtBx1v1QvOWJ3WF6qNkUj00A==
X-Received: by 2002:a05:6214:258a:: with SMTP id fq10mr24577637qvb.50.1642540115294;
        Tue, 18 Jan 2022 13:08:35 -0800 (PST)
Received: from localhost (fwdproxy-ash-000.fbsv.net. [2a03:2880:20ff::face:b00c])
        by smtp.gmail.com with ESMTPSA id h9sm11557936qkp.106.2022.01.18.13.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 13:08:35 -0800 (PST)
From: David Vernet <void@manifault.com>
To: konstantin@linuxfoundation.org
Cc: users@linux.kernel.org,
	tools@linux.kernel.org,
	void@manifault.com,
	kernel-team@fb.com
Subject: [PATCH 2/2] man: Update man page to use bold where appropriate
Date: Tue, 18 Jan 2022 13:08:10 -0800
Message-Id: <20220118210808.2158914-2-void@manifault.com>
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

