Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F6A72;
	Sun, 18 Jul 2021 04:43:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1626582873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1MDf372127xtxIa35FwXHUalhfjwqe9BeH2ccx6AL20=;
	b=YuPYXNPQIBYGSjocEArRnjw9zPlBhkwOanByFsG95EypzHYtl14CvmQFmkkNDLyX0/sgLu
	QWHQ+2DNlRx7BHt1eDHe/XUGA/Ypzc3m+rPRrEXoWnfMR7VOk+8Op6XFWhppOCB43NTeeg
	6SzEi2yG/aSxbmYkwgvlVemwNSqMVUBRF/l+9V+hcujzppn2JzvGm3eUIeQKoszHAIu5ul
	uKMCaw0k/t2cRO8XwYtO66QRFKEYAUOI3sxb9fpdz9fxBi7R8u3ffggM8nMk0Lr0RyfrWZ
	OVcoS2TwrS8ihiBJyhqtp4Afb3LduONu24xBUKvIwNYcvY4ce2UzBADJu1Woow==
From: Kyle Meyer <kyle@kyleam.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org,
	users@linux.kernel.org
Subject: [PATCH b4 2/2] Parse just headers when extracting message ID from stdin mbox
Date: Sun, 18 Jul 2021 00:34:06 -0400
Message-Id: <20210718043406.26727-3-kyle@kyleam.com>
In-Reply-To: <20210718043406.26727-1-kyle@kyleam.com>
References: <20210717212631-mutt-send-email-mst@kernel.org>
 <20210718043406.26727-1-kyle@kyleam.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

When the pr, mbox, and am subcommands grab a message ID from the mbox
on stdin, they call message_from_bytes(), which in turn calls
BytesParser().parsebytes(s).

parsebytes() has a headersonly parameter that can be used to tell it
to stop parsing after reading the headers.  The headers are all that's
needed here, so use BytesParser directly and set headersonly.

Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---

  Note: I've tested only `b4 am/mbox' with the reproducer message
  mentioned in upthread; I haven't tested `b4 pr'.

 b4/__init__.py | 4 +++-
 b4/pr.py       | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 5b32fb4..4722826 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1948,7 +1948,9 @@ def get_requests_session():
 
 def get_msgid_from_stdin():
     if not sys.stdin.isatty():
-        message = email.message_from_bytes(sys.stdin.buffer.read())
+        from email.parser import BytesParser
+        message = BytesParser().parsebytes(
+            sys.stdin.buffer.read(), headersonly=True)
         return message.get('Message-ID', None)
     return None
 
diff --git a/b4/pr.py b/b4/pr.py
index fbb2a71..e52c2ab 100644
--- a/b4/pr.py
+++ b/b4/pr.py
@@ -433,7 +433,10 @@ def main(cmdargs):
 
     if not sys.stdin.isatty():
         logger.debug('Getting PR message from stdin')
-        msg = email.message_from_bytes(sys.stdin.buffer.read())
+        from email.parser import BytesHeaderParser
+        from email.parser import BytesHeaderParser
+        msg = BytesParser().parsebytes(
+            sys.stdin.buffer.read(), headersonly=True)
         msgid = b4.LoreMessage.get_clean_msgid(msg)
         lmsg = parse_pr_data(msg)
     else:
-- 
2.32.0

