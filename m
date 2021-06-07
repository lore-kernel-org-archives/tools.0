Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B970
	for <tools@linux.kernel.org>; Mon,  7 Jun 2021 10:03:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CE094189F;
	Mon,  7 Jun 2021 06:02:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 07 Jun 2021 06:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=mB7WzX9Fw54Zn
	kxyU3H2f5Vl+iuJc0gzB/ThVS7QRWM=; b=tqDYrN0TeqoO0eo6fj1nt39B33xZW
	QdB/BWaEX7dMhLk8ePWO7TlerWbe9c9HQ03/wdEd+Z3cZHUeQpJGECvSmjIxEw4L
	ar3Xqz4U6EQNM61J0u6JPs4BeZ+ultL6Pv6YsJKi4zie+C6TQrqY9IbYU/0Voi9N
	1IuPDP4jzeYKlRQwE3xD7K3GN3Tte4lssj17+c6HBD+nWREi0Hf2YxSCyLsBRSj+
	UIYSAf841EpmTgdCQTT8T8eKezzFubqNBn0sM0jJL4g1zYsnbA98nGQ2u1uGHfyZ
	sTwYdTu7JPg2Qoeh+CDg4bKE5X/CzdQQ/P4b9w6lz6SJ35BUIKtrOOaiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=mB7WzX9Fw54ZnkxyU3H2f5Vl+iuJc0gzB/ThVS7QRWM=; b=pb1neLJd
	U4ld5WNa7mGGOTum8ML6owi0MUGSUZ5t7e1i1wImFPd22JCPcPU+Ox4gqNpRoV2Z
	kZN0K0ufPQ+4b/iekJRY0+sc5gHabhu6gV/HUuJw+3lYuUDgYJc+e8s00YUiN7ID
	aVi3YWZb1UfMX6nIDG+E1dLa1ZiY9ckpYnxfEuPuSpdW8BrrbbUbWd+vF2cFS1fU
	bAUo4fg5iiYN93E1PJVOrM9+3npzu6JssZOecCZ+KWigVrkZhFcfqejyBz4nnd9O
	PqU3UYDl0BSgDiOUaHFLobQpUiZ40kWJngXOM9g70uHd2mV8qBBlHwBJi7kggIMg
	Rgr3FnyM6K6BPw==
X-ME-Sender: <xms:0-69YPw9vE55Dlb9NQmyhngUOPFDW4_tsvon0nuVFkpnLFXj-tD_0A>
    <xme:0-69YHToHJpRB14DlqUUeXx7ZVAqZB91dZHa4fwtngXsoQT7CU5slt8PllYLWJfrK
    PJ3BQC66UL8DlvFhsM>
X-ME-Received: <xmr:0-69YJWJd3GVK-qab_j7Tsdf-ECxcU47gu8efOuOYL9ULjZTGhLq0FPzfVLjw3Lc1PS2dOtRDTf8mOaPGuBCECMkhUqcRoheRlD-3kvnuGcCca2F9x5AXdRyCp8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrrghulhcu
    uegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrh
    hnpefgvddttefgieekjeeigeevjeelhffgfeevjefhheevveeltdfhffekvedufedvhfen
    ucffohhmrghinhepmhhsghdrrghsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:0-69YJjewAW2ARRZTc6qDVdyepn7cbyX_VTeJpJt-2R9mtvImLniKA>
    <xmx:0-69YBAbf_uIiSm5WZ5wbkpvMAlBnSs-0wRjZ2zSI_NUqvhHo6YK9Q>
    <xmx:0-69YCKCFZv7Rnr1BcH8YbO-PJRiNdAJiK1pb8vKFCWq5GAE7k1kEQ>
    <xmx:0-69YO4kbDcBX05aJ5dcjEEIyiDqYYva9vfQpCkTwTcHLSPSkqZLVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 06:02:58 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
To: tools@linux.kernel.org,
	Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
Cc: Paul Barker <paul@pbarker.dev>
Subject: [b4][PATCH 2/2] Include dkim log output when -d/--debug argument is passed
Date: Mon,  7 Jun 2021 11:02:52 +0100
Message-Id: <20210607100252.8253-3-paul@pbarker.dev>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607100252.8253-1-paul@pbarker.dev>
References: <20210607100252.8253-1-paul@pbarker.dev>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; h=from:subject; bh=RYUoill86MggYgReF1Trxx0KiKUlzbs7fOaTSnZmuSU=; b=owGbwMvMwCG2OjnkzdxdX/IYT6slMSTsfXfqTotK6O89Wyqd72+2UDxqwbDv14IUvZgy7hn/zbUv v91a3lHKwiDGwSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJPP/O8FdauCZQrfBL5F3f0/uVBX Lv+J0x7F9zQcZt18yjs28+MrvEyNCTEjRphcx3/weJOz5ZbzvkyNX0Z9H6H7Z3vlxdq7JsgwgvAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp; fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
Content-Transfer-Encoding: 8bit

We can pass a logger object to dkim.verify() which will be used to
report internal errors and debugging info. This can be helpful when
investigating DKIM verification issues but is probably not wanted during
normal operation so the log level of each message is reset to DEBUG.
Each message is also prefixed with 'DKIM: ' to identify its origin when
debug output is enabled.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 b4/__init__.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 168b722..9721e22 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -47,6 +47,17 @@ __VERSION__ = '0.8-dev'
 
 logger = logging.getLogger('b4')
 
+def _dkim_log_filter(record):
+    # Hide all dkim logging output in normal operation by setting the level to
+    # DEBUG. If debugging output has been enabled then prefix dkim logging
+    # output to make its origin clear.
+    record.levelno = logging.DEBUG
+    record.levelname = 'DEBUG'
+    record.msg = 'DKIM: ' + record.msg
+    return True
+dkimlogger = logger.getChild('dkim')
+dkimlogger.addFilter(_dkim_log_filter)
+
 HUNK_RE = re.compile(r'^@@ -\d+(?:,(\d+))? \+\d+(?:,(\d+))? @@')
 FILENAME_RE = re.compile(r'^(---|\+\+\+) (\S+)')
 
@@ -1028,7 +1039,7 @@ class LoreMessage:
                     signtime = self.date
 
             self.msg._headers.append((hn, hval))  # noqa
-            res = dkim.verify(self.msg.as_bytes())
+            res = dkim.verify(self.msg.as_bytes(), logger=dkimlogger)
 
             attestor = LoreAttestorDKIM(res, identity, signtime, errors)
             logger.debug('DKIM verify results: %s=%s', identity, res)
-- 
2.31.1

