Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC734A263D
	for <tools@linux.kernel.org>; Wed, 14 Oct 2026 20:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009244; cv=pass; b=R0eBftzGB96IpTI+OfudpQclOkMTiDGimwGeJDdF2BeoEC4I5/Rvh5Pimvi2jGEmefB36WJVZcPF7DugCi9RlBJ3Bi4eZ5jOpz7Zk9GmMHX33aCOhE72qZqqd+XDJWN9npbw15cHrQTDErwTJrSLY/766D5nLmhz0BL9pK5aN4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009244; c=relaxed/simple;
	bh=4vb2eXfbW6+/f4wXZf5jH6MPzonkpYw0nuNM1KPcIn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=RdOpDE/iFpTa1BnTgaOJArn8ji+9TIB+cnX+sbkZMlgcQnLfbpzliet/vMh51ZKZkcuCamVa7xSOLxVDSisPUouC+hb20ju6l3N5HZwvaMJFqYrjyNbU2IPpBWmnEAa9MI6LR/XJpS4WmlGC0Iv0M5+gDivtaIqJq1OMehK7XaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b=EaAv44iC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QtlpY+Gf; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b="EaAv44iC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QtlpY+Gf"
Received: by smtp.kernel.org (Postfix)
	id 27CED1F000C4; Wed, 14 Oct 2026 20:20:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792009242;
	b=N3lhfNYuqjcnGSULL2SmwDX9nmhY3U6bQdFj2q3XIKKpijxNg/jLgKEDthTRTZS8PwWj
	 AWnPPl+wWfJlXXbB1XCi/pNogLAcAnU5VAm7qmVSTmYVFxNa14f7VjExmtfj/tvjrH4uh
	 hztG71OSdRGEPtDgxAsGmuX7pGMsxmL1NBM+w2RSRLxRPEGX9Jbu/G5njR7t3NOz5+0ct
	 //7YKoYcZMJhzHXeqj5nIsJGjQs2Lp9FuZ/65fleZr9RFZ0/5qtiu7QPEGAS+PHoDlL/E
	 fsapTHEfLWXkLId/IfrVgMbDuexzMtEtcO7dmFN0T7PLrT5yy8zzAm432g6yKe6cn6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792009242;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 In-Reply-To:References;
	bh=NpFXzswsln6K4MHFhustgde9u3+PmHejxpnzO6+nZOk=;
	b=1i6wtDBxglUFLnNVSe8/Hd3AeC84O0x6oUeCrQA3GcAl9rq3jing3qFCW2DlOL3HVm2R
	 4CVcBixlWRr58fQ/rwaTlVf1RFUXF7NVBSIJtpDPJh+zMmLgvcBWhrgucRZ7SlHeR+BtE
	 l58+Xl66k3vDPH1FkP+3OS32q/J1hX//onDP9tabK+85fb3tsOfSKUb04p5siyZ8QVlsy
	 dq9P2Hglyf4QbOSxA1Iq4LFbQBhhpXZkTY5wSaQcDn9AlOtetUgAqdqoA/CrPtZSqpvEs
	 Aw/0wxPRnE5+sWT2KOdS8e9FKl9u48Th8Y3oh6WBE2E2gjIGsK8N6kji6bjNo7kQBsA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=jetm.me header.i=@jetm.me header.a=rsa-sha256 header.s=fm1 header.b=EaAv44iC;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QtlpY+Gf;
	dmarc=pass header.from=jetm.me;
	spf=pass smtp.mailfrom=jetm.me;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B90311F000C5
	for <tools@kernel.org>; Wed, 14 Oct 2026 20:20:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jetm.me header.i=@jetm.me header.a=rsa-sha256 header.s=fm1 header.b=EaAv44iC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QtlpY+Gf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B90311F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jetm.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=jetm.me
Received: from stl-compute-03.internal (stl-compute-03.internal [10.204.2.63])
	by mailfout.stl.internal (Postfix) with ESMTP id 624E31D000D6
	for <tools@kernel.org>; Wed, 14 Oct 2026 16:20:40 -0400 (EDT)
Received: from stl-imap-04 ([10.204.2.95])
  by stl-compute-03.internal (MEProxy); Wed, 14 Oct 2026 16:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792009240;
	 x=1792095640; bh=NpFXzswsln6K4MHFhustgde9u3+PmHejxpnzO6+nZOk=; b=
	EaAv44iCaqmjWVmmGsAFHUssfdcX49L55ThBjveOEv82EcVZmOXzyKDKklvPvcwH
	JDIODBeR7ZxjAD7FIBVnKYTmoM+lLMk8m6a+lMezN4+pg1EQVotm+8mo+Va3WVRo
	9zdOUw0WQ0aTWlph9oqUFF7pKV3H5k+NAZxa69X46kZ8w5ZD1W+sdx1GRBfxFYFs
	3DX92iyQMZCp0r4ZpIWgbrzsVhFQvnQtUZib2vctDLKMLTGP4QWAtskrNc5570Q9
	7W1cwgIrEPmkE+nHn4sNx2/i85CvGLXnHIRTnz2A0LXUGBnWmnm/HHQ9ZIZnKXLr
	OrA9T5RsVfNQjD/liXJzhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792009240; x=
	1792095640; bh=NpFXzswsln6K4MHFhustgde9u3+PmHejxpnzO6+nZOk=; b=Q
	tlpY+Gf8TPvVp3qVb76qz2+QPTUAI8fnYR3jG+85a+60sEB0xBOZ1n5o/3oTfWt8
	MIUbeqVR3d6FZYAOSF4OWt+VdLLo5ZVy4q4h8gvAKjE05edLUqHo1PG4Mdv2LpRI
	A2ZxVmqGYisEOqKZlvzVgxGvySGfTC4aKVOx5CNdsRSMl4TCjFZqZ0SQBZ+yzl36
	fPh9I3eHx2N99VnMIbhJy8sO406TTphK/BhEMazNEJHDd97nuV7h+lcugzriqRBa
	i6AXQbkguwcKS/iLtYh43pxsWBwU7ZgOj+/qLP63pOnizt5Ljeku9e1Cn7GoOFC0
	ZCqzwl19cRtrwnhs9sMaQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=jetm.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792009240; d=jetm.me;
	mf=PGZsb3NzQGpldG0ubWU+; rt=PHRvb2xzQGtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:078vvMhzQNQndWO5tdJAjwdLe/tcavAtToNMCIBDkTCUjyY
	4aO84bdAeIRUN/dWctyjicmsKpJpUGNG4CKFNLpl45Uq3wP7zohx0h6GUE9eZaKh
	FDqvpyZQ4/6jAkrc0J43qHqsvvQ+xCchfxwxH/dQ8NfO2icRn6E6Rx94MVP1a6jY
	jZYG7L8aC0bg5sVpkmaLn31Dx2Aqf3TBRSiVVHpJXSfFG4qiyr7sUDfGi/QyuUUP
	x9kYtjGI72ES30uPCQcGKJ3eGDQLdDVtRYx4RTGF+f5dXZ3wVlPjpajh27ffMg+y
	p7AHh74hxKLTj6FQSo7r2gmDQPU3+/7WdIbS8ew==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:smxTj6hBuRoL/2pe5GRp+t1Sjn+sa3pzqWusOEUiXdc=:4vb2eXfbW6+/f4wXZf5jH6MPzonkpYw0nuNM1KPcIn0=;
X-ME-Sender: <xms:GOTPakDOVz2tbAl4nfulBTk8m1mv5CgwtpWqlyTNnDbtyLdRJrXppw>
    <xme:GOTPahUlP4CA4NsVq0y7FlmAaKnITqSxgamzfdpqvIE133AcNLZF-PoR8bjZh-FXH
    Mo6YUPLse5qu_W9HyYgsqPCO-1Cwyg6ywzGG8dkei3mwTMgzLfJVb0>
X-ME-Proxy-Cause: dmFkZTGIZlY8D3zEzUYjH9aDQQ0fW30zZAM6l5GqFDINDX7f0vFVWN5iBKFnz4f/F5TCkV
    +UAna1QqdEoaL0ThM9s9ol05IVcFNxJQYBqx8pmbFAnFiK8bbJ4Y23WX5REP4L/PHMCehL
    qngb/9f/odMLW4BsI1KYbxZe69LfOvDUTA1niDbHmWR0rCRYnxzCwoCTBaCFm1CMAMX0XX
    w0nsZPGcOi9aGWqzzGrRh9UYMUWTwjOgCZ/yapOURN090egMMCrEeC2VZQTxO/t2pgFqAx
    lmVyXtcV9PkqU17tjk/SuJRBUlpz4vkMEsoT4gpK1ccCIuOOfRalw2DO8v/5Tcj4KuRvN5
    LZHOXTSjMIdr2dWPNZxYqDqqrPkunk9V8u8NtB7Nn3tAg1GaV4raof2tQTEUkTcqHaPYae
    5axotX6dVHCzUsdg/1gdKtD7afmZ/os/P2M8kd4tqjolQ54pxn/HA41JuP7+ql9w78g4xB
    hDv43E4/5p3vyppi/mHeU1zXQ+FEng/R7GXbuMkGzopFWlcXnscBTV/iJlIGNb/ahJkPou
    H7mDv3c3upOuyfwZRrpDkpgU7neAw9FBJNR5+uOn3MzvJ0FtQ+iZDDvT7fRtEv4XYkcPKJ
    4uSxRJ7KNIRRfxbLPKtt4ZKfFlYf/YW0phyb/xHoIBIdFcYEALyF7U4VznrQ
X-ME-Proxy: <xmx:GOTPaphky6-VentfrohNkR3s5SbgTtfPCCkkqsEVUPMWnmICRGcSvQ>
    <xmx:GOTPakAErvqwd-J0mmHsR3EzhJwn23c0HHMCD5KjsYAvNX8PbiGOTA>
    <xmx:GOTPamtFMrOTfPHD_3nIzZcjInMvNtT-NEE9_6SFTgVOdFJK68Jqzw>
    <xmx:GOTPapb5Q2dnU1-XvsFdUYx-GnW4o-GJy77Y3qYZz6vImiq8laFKiQ>
    <xmx:GOTPaukf9mYOMZIs4e4mdLklY6k5xqm04N5GYDABVHNO4K3jI8kny-Ch>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 152348006D; Wed, 14 Oct 2026 16:20:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 14 Oct 2026 14:20:36 -0600
Subject: [PATCH kgl 1/3] Treat a corrupt feed state file the same as a
 missing one
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-fix-feed-state-corruption-v2-v1-1-41bb71ddc15a@jetm.me>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=21158; i=floss@jetm.me;
 h=from:subject:message-id; bh=4vb2eXfbW6+/f4wXZf5jH6MPzonkpYw0nuNM1KPcIn0=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBqz+QTzSH63gRAzjRekw3CVAsOQ/i3oDR1S+u4W
 BoE/aPBUSuJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCas/kEwAKCRC17sMLqGd3
 Hzs9DACn6EoL1u5u6DA/rCBU8mtwbg1ujnPtNYeOBijw478sVjzfC6dOb7My8RRK14fOgcophSF
 /cPffVl/B21FaMhTfkQVXX8irW/8GBqvG01mNX+T0Ev60Y5+E32Y4vROZ89acjBlqtf0Z2IkacF
 tEqW6vtt3A7FBHIVLdYa5vMs0iOM9lYufxYYE/pxglxOHnxdKazdHkbSV2UO+XL3GoOIekMx1tm
 coFSZHyifD08J6QwEzAvMXEbdRnkxeMi3bEZjrtOd1IfdTfDhjeuZNbX4jWaHQHNhtYmjyK0w4E
 /K/BVLpElmG56phWVgciRtgAsWVMMDJNfofdWE/1g9iq7sGD70FR871B1dZ6G2OwXz7/ZWrkX2I
 oQoHDvABwvQCfTrn4gQBldmjAOOELvJYA6dY/xtAGzz7qTwWH3A7bXk6bTTHuF/t+vmwaYjNxgM
 zf242UE2utFC8svYIemMhWEFIchsWzcatlotsDyo7DrA5QWnA+xpxWe1l8ksMdcbCwy1I=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>
References: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>

load_feed_state() only raised StateError when korgalore.feed was
absent. A zero-byte or truncated file - the shape left behind when a
write never reached disk, e.g. the process was killed mid-write by a
host crash - still passes the existence check and falls into a bare
json.load(), which raises an unhandled JSONDecodeError (or, for valid
JSON that isn't an object, trips a bare assert) instead of the
StateError that update_feed() already knows how to recover from.
Non-UTF-8 bytes from the same kind of torn write raise a different,
equally uncaught UnicodeDecodeError. Valid JSON missing the 'epochs'
key everything else assumes is there - e.g. a truncated '{}' - passed
through silently and crashed whatever read finfo['epochs'] next.

That recovery path exists and is correct: update_feed() catches
StateError and calls init_feed(), which calls save_feed_state() to
rebuild the file from the feed's current git state. The fix isn't
just catching more exception types in load_feed_state() though -
save_feed_state() has the exact same unguarded json.load() when the
state file already exists, reached by this exact recovery path
(update_feed -> init_feed -> save_feed_state), so routing more cases
into StateError only moved the crash one frame deeper into the
function meant to fix it.

Extract the read-and-validate logic both functions need into
_parse_feed_state_file(), raising StateError for a parse error, a
decode error, or the wrong shape. load_feed_state() keeps its own
missing-file handling (including the legacy-migration attempt) and
calls the shared helper once a file is confirmed to exist.
save_feed_state() calls it directly and falls back to a fresh state on
StateError - deliberately not through load_feed_state() itself, which
would recurse through _perform_legacy_migration()'s own trailing
save_feed_state() call while the file still doesn't exist.

Raising isn't enough on its own either: update_feed() only reported
STATUS_INITIALIZED for this recovery, which perform_pull() treats as
"set up delivery state for a new feed" rather than "run deliveries
this pull" - a corrupt file's delivery pointer survives recovery
untouched, so a feed with real messages waiting would sit until its
next change instead of catching up this pull. Add StateCorruptError, a
StateError subclass _parse_feed_state_file() raises instead of the
base class, so update_feed() can tell "corrupt" apart from "missing"
and report STATUS_INITIALIZED | STATUS_UPDATED for the corrupt case -
STATUS_UPDATED already exists as a separate bit precisely so a caller
can combine them.

Tighten the shape check itself while here: an empty 'epochs' dict
passed it, since isinstance({}, dict) is true, but every caller that
does max() over its keys crashes on an empty one. save_feed_state()
never writes an empty 'epochs' dict, so require it be non-empty too.

feed_updated()'s own except StateError branch already treats a missing
or corrupt file as "assume updated" and needs no logging of its own -
both update_feed() implementations already catch StateError and
recover before ever reaching feed_updated() on this path, so a log
placed there would be unreachable. Log once, where the recovery
actually happens, in each update_feed()'s except branch.

Signed-off-by: Javier Tia <floss@jetm.me>
---
 src/korgalore/__init__.py  |   8 ++
 src/korgalore/lei_feed.py  |  22 +++++-
 src/korgalore/lore_feed.py |   9 ++-
 src/korgalore/pi_feed.py   |  49 +++++++++---
 tests/test_pi_feed.py      | 187 ++++++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 258 insertions(+), 17 deletions(-)

diff --git a/src/korgalore/__init__.py b/src/korgalore/__init__.py
index 71a4d2d..be34c37 100644
--- a/src/korgalore/__init__.py
+++ b/src/korgalore/__init__.py
@@ -110,6 +110,14 @@ class StateError(KorgaloreError):
     """Raised when there is an error with the internal state."""
 
 
+class StateCorruptError(StateError):
+    """Raised when state exists on disk but cannot be used, as opposed to
+    being simply missing - callers that treat the two differently (e.g. to
+    decide whether a delivery pointer is still trustworthy) catch this
+    subclass rather than inspecting StateError's message.
+    """
+
+
 class DeliveryError(KorgaloreError):
     """Raised when there is an error during message delivery."""
 
diff --git a/src/korgalore/lei_feed.py b/src/korgalore/lei_feed.py
index 15aab3d..a884829 100644
--- a/src/korgalore/lei_feed.py
+++ b/src/korgalore/lei_feed.py
@@ -2,7 +2,15 @@ import json
 import logging
 from pathlib import Path
 
-from korgalore import ConfigurationError, GitError, PublicInboxError, StateError, run_git_command, run_lei_command
+from korgalore import (
+    ConfigurationError,
+    GitError,
+    PublicInboxError,
+    StateCorruptError,
+    StateError,
+    run_git_command,
+    run_lei_command,
+)
 from korgalore.pi_feed import PIFeed
 
 logger = logging.getLogger('korgalore')
@@ -143,9 +151,17 @@ class LeiFeed(PIFeed):
 
         try:
             finfo = self.load_feed_state()
-        except StateError:
+        except StateError as e:
+            was_corrupt = isinstance(e, StateCorruptError)
+            if was_corrupt:
+                # Unlike a missing file, a corrupt one may have been
+                # tracking deliveries that are still owed - init_feed()
+                # only sets the delivery pointer's reference point, so
+                # report STATUS_UPDATED too and let this pull's delivery
+                # pass run against it instead of waiting for the next one.
+                logger.warning('%s; recovering by reinitializing feed', e)
             self.init_feed()
-            return self.STATUS_INITIALIZED
+            return self.STATUS_INITIALIZED | self.STATUS_UPDATED if was_corrupt else self.STATUS_INITIALIZED
 
         known_epochs = [int(e) for e in finfo['epochs']]
         highest_known_epoch = max(known_epochs)
diff --git a/src/korgalore/lore_feed.py b/src/korgalore/lore_feed.py
index 7807a8f..5594d09 100644
--- a/src/korgalore/lore_feed.py
+++ b/src/korgalore/lore_feed.py
@@ -6,7 +6,7 @@ from gzip import GzipFile
 from pathlib import Path
 from typing import Any
 
-from korgalore import RemoteError, StateError, run_git_command
+from korgalore import RemoteError, StateCorruptError, StateError, run_git_command
 from korgalore.pi_feed import PIFeed
 from liblore import LoreNode
 
@@ -282,9 +282,12 @@ class LoreFeed(PIFeed):
         """
         try:
             feed_state = self.load_feed_state()
-        except StateError:
+        except StateError as e:
+            was_corrupt = isinstance(e, StateCorruptError)
+            if was_corrupt:
+                logger.warning('%s; recovering by reinitializing feed', e)
             self.init_feed()
-            return self.STATUS_INITIALIZED
+            return self.STATUS_INITIALIZED | self.STATUS_UPDATED if was_corrupt else self.STATUS_INITIALIZED
         local_epoch_info = self.load_epochs_info()
         remote_epoch_info = self.get_manifest_epochs()
         if local_epoch_info == remote_epoch_info:
diff --git a/src/korgalore/pi_feed.py b/src/korgalore/pi_feed.py
index 4e7de81..cfce185 100644
--- a/src/korgalore/pi_feed.py
+++ b/src/korgalore/pi_feed.py
@@ -11,7 +11,7 @@ from typing import Any
 
 from liblore.utils import clean_header, msg_get_subject, parse_message
 
-from korgalore import FeedLockedError, GitError, PublicInboxError, StateError, run_git_command
+from korgalore import FeedLockedError, GitError, PublicInboxError, StateCorruptError, StateError, run_git_command
 
 logger = logging.getLogger('korgalore')
 
@@ -828,7 +828,8 @@ class PIFeed:
         try:
             feed_state = self.load_feed_state()
         except StateError:
-            # We return True because there is no state, so we treat it as having been updated
+            # No usable state - missing (routine on a brand new feed) or
+            # corrupt - so treat it as having been updated.
             return True
 
         epochs = feed_state.get('epochs', {})
@@ -854,6 +855,35 @@ class PIFeed:
 
         return False
 
+    def _parse_feed_state_file(self, state_file: Path) -> dict[str, Any]:
+        """Parse an existing feed-level state file.
+
+        Caller must have already confirmed state_file.exists(). Does no
+        migration and no existence check of its own, so load_feed_state()
+        and save_feed_state() can both call it directly without going
+        through each other.
+
+        Raises StateCorruptError if the file exists but isn't a usable feed
+        state - not valid JSON, not a JSON object, or missing a non-empty
+        'epochs' dict. A torn write from a host crash can produce any of
+        these as easily as leaving the file missing.
+        """
+        with state_file.open() as f:
+            try:
+                result = json.load(f)
+            except (json.JSONDecodeError, UnicodeDecodeError) as e:
+                # UnicodeDecodeError covers a multi-byte UTF-8 character cut
+                # in half by the same torn write that produces bad JSON syntax.
+                raise StateCorruptError(f'Feed state corrupt: {state_file}: {e}') from e
+        if not isinstance(result, dict) or not isinstance(result.get('epochs'), dict) or not result['epochs']:
+            # Valid JSON that isn't the shape every caller assumes - e.g. a
+            # bare list, an empty object, or one with no 'epochs' key - is
+            # exactly as unusable as a parse error. save_feed_state() never
+            # writes an empty epochs dict, so an empty one here is corrupt,
+            # not merely a feed with nothing recorded yet.
+            raise StateCorruptError(f'Feed state corrupt: {state_file}: missing, invalid, or empty "epochs" key')
+        return result
+
     def load_feed_state(self) -> dict[str, Any]:
         """Load feed-level state (epochs and metadata) from disk."""
         state_file = self._get_state_file_path(delivery_name=None, suffix='feed')
@@ -863,10 +893,7 @@ class PIFeed:
             if not state_file.exists():
                 raise StateError(f'Feed state not found: {state_file}')
 
-        with state_file.open() as f:
-            result = json.load(f)
-            assert isinstance(result, dict)
-            return result
+        return self._parse_feed_state_file(state_file)
 
     def save_feed_state(self, epoch: int | None = None, latest_commit: str | None = None, success: bool = True) -> None:
         """Save feed-level state to disk."""
@@ -878,11 +905,13 @@ class PIFeed:
         if latest_commit is None:
             latest_commit = self.get_top_commit(epoch)
 
-        state: dict[str, Any]
+        # Via _parse_feed_state_file() so a missing or corrupt file both
+        # fall back to a fresh state, matching load_feed_state()'s own guard.
+        state: dict[str, Any] | None = None
         if state_file.exists():
-            with state_file.open() as f:
-                state = json.load(f)
-        else:
+            with contextlib.suppress(StateError):
+                state = self._parse_feed_state_file(state_file)
+        if state is None:
             state = {
                 'epochs': {},
                 'extra_data': {
diff --git a/tests/test_pi_feed.py b/tests/test_pi_feed.py
index 2eab4f5..2082e49 100644
--- a/tests/test_pi_feed.py
+++ b/tests/test_pi_feed.py
@@ -20,7 +20,8 @@ from unittest.mock import patch
 
 import pytest
 
-from korgalore import FeedLockedError, PublicInboxError
+from korgalore import FeedLockedError, PublicInboxError, StateError
+from korgalore.lei_feed import LeiFeed
 from korgalore.pi_feed import LOCKED_FEEDS, RETRY_FAILED_INTERVAL, PIFeed
 from tests.conftest import make_pi_feed
 
@@ -295,3 +296,187 @@ class TestLegacyMigration:
             (feed_dir / 'git').mkdir()
 
         make_pi_feed(feed_dir, key='new-feed', highest_epoch=None, top_commit=None)._perform_legacy_migration()
+
+
+class TestLoadFeedState:
+    """load_feed_state() raises StateError for anything that means 'no
+    usable state', not just a missing file, so update_feed()'s existing
+    except StateError: self.init_feed() recovery also covers a corrupt one.
+    """
+
+    def test_missing_file(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """No korgalore.feed and nothing to migrate from."""
+        with pytest.raises(StateError, match='not found'):
+            mock_feed.load_feed_state()
+
+    def test_empty_file(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """A zero-byte file, e.g. left by a write that never reached disk
+        before an unclean shutdown."""
+        (temp_feed_dir / 'korgalore.feed').write_text('')
+
+        with pytest.raises(StateError, match='corrupt'):
+            mock_feed.load_feed_state()
+
+    def test_truncated_json(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """Partial JSON, e.g. left by a write cut off mid-content."""
+        (temp_feed_dir / 'korgalore.feed').write_text('{"epochs": {"0": {')
+
+        with pytest.raises(StateError, match='corrupt'):
+            mock_feed.load_feed_state()
+
+    def test_non_utf8_bytes(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """A multi-byte UTF-8 character cut in half by the same kind of torn
+        write that produces bad JSON syntax - a different exception type
+        (UnicodeDecodeError) if not caught alongside it."""
+        (temp_feed_dir / 'korgalore.feed').write_bytes(b'{"epochs": {"0": {"a": "\xff\xfe garbage')
+
+        with pytest.raises(StateError, match='corrupt'):
+            mock_feed.load_feed_state()
+
+    def test_wrong_shape(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """Valid JSON that isn't the expected object, e.g. a bare list."""
+        (temp_feed_dir / 'korgalore.feed').write_text('[]')
+
+        with pytest.raises(StateError, match='epochs'):
+            mock_feed.load_feed_state()
+
+    def test_missing_epochs_key(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """A JSON object missing the 'epochs' key - e.g. a truncated write
+        that happened to stop right after an opening brace plus whitespace -
+        is a dict, but not a usable one."""
+        (temp_feed_dir / 'korgalore.feed').write_text('{}')
+
+        with pytest.raises(StateError, match='epochs'):
+            mock_feed.load_feed_state()
+
+    def test_empty_epochs_dict(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """A JSON object with an empty 'epochs' dict - e.g. a write cut off
+        right after the dict's opening brace - is a dict, but every caller
+        that does max() over its keys crashes on it, so it's as unusable
+        as a missing 'epochs' key."""
+        (temp_feed_dir / 'korgalore.feed').write_text('{"epochs": {}}')
+
+        with pytest.raises(StateError, match='epochs'):
+            mock_feed.load_feed_state()
+
+    def test_valid_file(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """A well-formed state file loads back unchanged."""
+        state = {'epochs': {'0': {'last_update': OLD, 'update_successful': True, 'latest_commit': 'abc123'}}}
+        (temp_feed_dir / 'korgalore.feed').write_text(json.dumps(state))
+
+        assert mock_feed.load_feed_state() == state
+
+
+class TestSaveFeedState:
+    """save_feed_state() reads any existing state through the same guard as
+    load_feed_state(), so it recovers from a corrupt file instead of
+    crashing one frame deeper than where load_feed_state() would have.
+    """
+
+    @pytest.mark.parametrize(
+        'content',
+        [
+            pytest.param(b'', id='empty-file'),
+            pytest.param(b'{"epochs": {"0": {', id='truncated-json'),
+            pytest.param(b'[]', id='bare-list'),
+            pytest.param(b'{}', id='missing-epochs-key'),
+            pytest.param(b'{"epochs": {}}', id='empty-epochs'),
+            pytest.param(b'{"epochs": {"0": {"a": "\xff\xfe garbage', id='non-utf8'),
+        ],
+    )
+    def test_recovers_from_corrupt_file(self, mock_feed: PIFeed, temp_feed_dir: Path, content: bytes) -> None:
+        (temp_feed_dir / 'korgalore.feed').write_bytes(content)
+
+        mock_feed.save_feed_state(epoch=0, latest_commit='deadbeef')
+
+        state = mock_feed.load_feed_state()
+        assert state['epochs']['0']['latest_commit'] == 'deadbeef'
+
+    def test_does_not_recurse_through_legacy_migration(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """save_feed_state(), on a missing file, must not route through
+        load_feed_state()'s migration-triggering branch - migration's own
+        last step calls save_feed_state() again while the file still
+        doesn't exist, which would recurse forever if save_feed_state()
+        read state through load_feed_state() instead of the narrower
+        _parse_feed_state_file() helper."""
+        with patch.object(
+            mock_feed, '_perform_legacy_migration', side_effect=lambda: mock_feed.save_feed_state(epoch=0)
+        ) as mock_migration:
+            mock_feed.save_feed_state(epoch=0, latest_commit='deadbeef')
+
+        mock_migration.assert_not_called()
+
+        state = mock_feed.load_feed_state()
+        assert state['epochs']['0']['latest_commit'] == 'deadbeef'
+
+    def test_preserves_existing_epochs(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """A valid file's other epochs survive a save for a new one."""
+        existing = {'epochs': {'0': {'last_update': OLD, 'update_successful': True, 'latest_commit': 'old'}}}
+        (temp_feed_dir / 'korgalore.feed').write_text(json.dumps(existing))
+
+        mock_feed.save_feed_state(epoch=1, latest_commit='new')
+
+        state = mock_feed.load_feed_state()
+        assert state['epochs']['0']['latest_commit'] == 'old'
+        assert state['epochs']['1']['latest_commit'] == 'new'
+
+
+class TestUpdateFeedRecoversFromCorruptState:
+    """End-to-end: LeiFeed.update_feed() on a corrupted state file recovers
+    like it does for a missing one, matching what update_feed()'s own
+    except StateError: self.init_feed() branch has always claimed to do -
+    but a corrupt file, unlike a missing one, may have deliveries still
+    owed against it, so recovery must also report STATUS_UPDATED and not
+    just STATUS_INITIALIZED, or those deliveries wait for the feed's next
+    change instead of running this pull.
+    None of the load_feed_state()/save_feed_state() tests above go through
+    update_feed() itself, so they could not have caught save_feed_state()
+    crashing one frame into its own recovery, or the status value bug.
+    """
+
+    def _make_lei_feed(self, feed_dir: Path) -> LeiFeed:
+        class StubLeiFeed(LeiFeed):
+            def __init__(self) -> None:
+                PIFeed.__init__(self, feed_key='lei-feed', feed_dir=feed_dir)
+                self.feed_type = 'lei'
+                self.feed_url = f'lei:{feed_dir}'
+                self.known_searches = [str(feed_dir)]
+
+            def get_highest_epoch(self) -> int:
+                return 0
+
+            def get_top_commit(self, epoch: int) -> str:
+                return 'deadbeef'
+
+        return StubLeiFeed()
+
+    def test_corrupt_state_recovers_and_reports_updated(self, tmp_path: Path) -> None:
+        feed_dir = tmp_path / 'lei-feed'
+        feed_dir.mkdir()
+        (feed_dir / 'git' / '0.git').mkdir(parents=True)
+        (feed_dir / 'korgalore.feed').write_text('')  # the exact original bug
+
+        feed = self._make_lei_feed(feed_dir)
+        with patch('korgalore.lei_feed.run_lei_command', return_value=(0, b'')):
+            status = feed.update_feed()
+
+        assert status == feed.STATUS_INITIALIZED | feed.STATUS_UPDATED
+        state = feed.load_feed_state()
+        assert state['epochs']['0']['latest_commit'] == 'deadbeef'
+
+    def test_missing_state_only_initializes(self, tmp_path: Path) -> None:
+        """A genuinely missing file has no deliveries that could be owed,
+        so recovery keeps reporting plain STATUS_INITIALIZED - the more
+        conservative, unchanged behavior for this case."""
+        feed_dir = tmp_path / 'lei-feed'
+        feed_dir.mkdir()
+        (feed_dir / 'git' / '0.git').mkdir(parents=True)
+        # No korgalore.feed at all.
+
+        feed = self._make_lei_feed(feed_dir)
+        with patch('korgalore.lei_feed.run_lei_command', return_value=(0, b'')):
+            status = feed.update_feed()
+
+        assert status == feed.STATUS_INITIALIZED
+        state = feed.load_feed_state()
+        assert state['epochs']['0']['latest_commit'] == 'deadbeef'

-- 
2.56.0

