Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFD72FAD;
	Sun, 18 Jul 2021 04:43:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1626582870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOYF60BHdw2lhhPns6AYRE2nHA7HA4jKCZLGiyq2NKs=;
	b=zkHCz+rUxObMyAYyQ6Ju0kBLvKgONihgioSKgf6G2Iy7iXtw0geLbFRTW5wO0z4LQbu2qN
	eTCQIUZ+wsVVQgtueFv0m5CBjFsQeDWbLVAcH94/9sz2eBAfiBprD7o7rR6ihQxjSbBOzP
	erLHYabC7SXjcEmBrBS9c5X9AhsmOk6m8XQ5wzsQk3dpe+FTJPqilTMx263IWW5GdJCF2p
	NEbWWZ7/p0iipB26eux9ICgNzyq0IfDB8UQXBeIhBcLV5KV+Li2llPs+lG8sPm/QgZ8VF3
	CZ1/pnHFF5S83o338BJD+nDG46NYrH+7jGgzZp8+sMEMpNQ6JMDHJ4yEgcrdpw==
From: Kyle Meyer <kyle@kyleam.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org,
	users@linux.kernel.org
Subject: [PATCH b4 1/2] Avoid decoding errors when extracting message ID from stdin
Date: Sun, 18 Jul 2021 00:34:05 -0400
Message-Id: <20210718043406.26727-2-kyle@kyleam.com>
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

The mbox, am, and pr subcommands accept an mbox on stdin and extract
the message ID.  When stdin.read() is called, Python assumes the
encoding is locale.getpreferredencoding(False).  This may not match
the content encoding, leading to a decoding error.

Instead feed the stdin bytes to message_from_bytes(), which leads to a
decode('ASCII', errors='surrogateescape') underneath.  That's
sufficient to get the message ID from the ASCII headers.

Reported-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---

  Note: I've tested only `b4 am/mbox' with the reproducer message
  mentioned in upthread; I haven't tested `b4 pr'.

 b4/__init__.py | 2 +-
 b4/pr.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 0e007be..5b32fb4 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1948,7 +1948,7 @@ def get_requests_session():
 
 def get_msgid_from_stdin():
     if not sys.stdin.isatty():
-        message = email.message_from_string(sys.stdin.read())
+        message = email.message_from_bytes(sys.stdin.buffer.read())
         return message.get('Message-ID', None)
     return None
 
diff --git a/b4/pr.py b/b4/pr.py
index d8ff7f4..fbb2a71 100644
--- a/b4/pr.py
+++ b/b4/pr.py
@@ -433,7 +433,7 @@ def main(cmdargs):
 
     if not sys.stdin.isatty():
         logger.debug('Getting PR message from stdin')
-        msg = email.message_from_string(sys.stdin.read())
+        msg = email.message_from_bytes(sys.stdin.buffer.read())
         msgid = b4.LoreMessage.get_clean_msgid(msg)
         lmsg = parse_pr_data(msg)
     else:
-- 
2.32.0

