Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B932FAE
	for <tools@linux.kernel.org>; Sun, 23 May 2021 03:06:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1621738708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WBasxHBpTy5Tumd3367tgzQmxOi02glVUx7LY1MriWM=;
	b=kaFeV5cenJ/3wiCmmFMzKbB1JA6k77Uh/n+Q4pHk20ic6/dnXfikPOl91lLEg/SQKAR2bg
	LzSKV/6cO5KRlOjWoLdFKG4UHU+5nGgvCKTDC50E5jRsFMcz1QX9122UdfwFQuDBcT3jup
	5R60BKIIwJeUa9LOVwo60lZd/RZhJf7WZIquSIqm/OMlIb8LgmQ0VC8eVhWUxrDxGWAPqz
	+wGV6JVLYtl91fBqp5VXBKvqiCwkEw6ch9nyyfj+fWtmpJNIW3bc5u/VxqBiV0hG/z5yhc
	PcW99lLChrIk6RCmF8yuvKMOlyiTgBQSfSUW5SmH33oRMBLmJuma3VwMj3hw5w==
From: Kyle Meyer <kyle@kyleam.com>
To: tools@linux.kernel.org
Subject: [PATCH b4] Avoid type error when local mbox lacks specified message ID
Date: Sat, 22 May 2021 22:58:12 -0400
Message-Id: <20210523025812.26456-1-kyle@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

Calling b4-am with --use-local=MBOX is supposed to abort with "Could
not find MID in MBOX" if the mbox doesn't contain the specified
message ID.  As of 4950093c0 (Don't use mboxo for anything,
2021-05-18), a type error is signaled because get_strict_thread()
returns None when there are no matches, and get_msgs() feeds this
result to len().

Update get_msgs() to instead check whether the returned value
evaluates to false.

Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---
 b4/mbox.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index a4b005f..bf1a586 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -572,7 +572,7 @@ def get_msgs(cmdargs) -> Tuple[Optional[str], Optional[list]]:
 
             if msgid:
                 msgs = b4.get_strict_thread(in_mbx, msgid)
-                if not len(msgs):
+                if not msgs:
                     logger.critical('Could not find %s in %s', msgid, cmdargs.localmbox)
                     sys.exit(1)
             else:

base-commit: 7ed8a3cafd5f3ba5b4e914b495bb3035428e2d45
-- 
2.31.1

