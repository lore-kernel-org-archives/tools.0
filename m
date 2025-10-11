Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE7F2405FD
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760225896; cv=none; b=hh2jJ7yejbmLSoNjJ0kE8CFn7qzlg88oamYO/5aDMXSQbjAvNhYpMCb1GmJjTIi38W8ke2gWwf376/LAPZAR6yUxbSvnHj0T/TiB9/DcI0tOgT9ewRR8J/i1cKxe/21bhR/51t1AkEXFTAnHZ2GeQcn5qz+18Bdy5/7dHIDPuyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760225896; c=relaxed/simple;
	bh=ExPHSFqKBAzlQJ/Py5hKnKQG821sRxAtUgnpNnatvTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fo1Ceihki4PiW45TST+NM8l+jeMac0siFtp6fzgAt1fIqEBC9Tgh4/PKSZFBto/zYY+ILnCBNKBxta9LIGBqe7AQnDh2oC/ptxEVpuLj3je+sHO4WUWdumj57DwUkbToWc23NCy9L7VJYyERawQgK9KZfUBe0mLeJ6rVqX7AjPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4c581rU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4c581rU"
Received: by smtp.kernel.org (Postfix)
	id 70429C113D0; Sat, 11 Oct 2025 23:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A03C4CEF4;
	Sat, 11 Oct 2025 23:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760225896;
	bh=ExPHSFqKBAzlQJ/Py5hKnKQG821sRxAtUgnpNnatvTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4c581rUTt/pLeZQoGlx1yzR/JDdCl1ht3/xX6LyPdwn7odFjdGQkLsD1Dxs873Xq
	 GUJesKp9xHyOVwovz+qOrsL48I2DsekcDcLg2iTj33ZvoaM1HCLJSVf/7p4kGw1pta
	 Glp96DDSjIo0bTElYaN/eZvQbkABTzbzV9pYyRF69PG7bwqxVEVUhVqbtcjd7qmFrk
	 wWP1lCTniIoQlqlmRwse4XTI2enbzlXm/u2VlhAzw+C3yv7vhPMMNBvLGhgfdmFyHx
	 MdETvsqkQYCxmwCwM+N9+o+LxijK19G3le+CqD+TcAzDgrkKPDvRqvb59DUh32i5qy
	 ZQQo7nJZWMtiQ==
Date: Sat, 11 Oct 2025 19:38:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
	tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <aOrqZsBZemu6MkAd@laps>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <CAHk-=wgNNVkgDco67tVceM87B7kkVZK=Oz8RZti1v6N2_+S+2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="JzR/gZ5SxzllHGnN"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgNNVkgDco67tVceM87B7kkVZK=Oz8RZti1v6N2_+S+2w@mail.gmail.com>


--JzR/gZ5SxzllHGnN
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sat, Oct 11, 2025 at 03:46:39PM -0700, Linus Torvalds wrote:
>On Fri, 10 Oct 2025 at 13:48, Konstantin Ryabitsev
><konstantin@linuxfoundation.org> wrote:
>>
>> 1. We don't currently weed out AUTOSEL/stable backports, so older commits may
>>    end up in lots of false positives for now. I've not yet figured out how to
>>    avoid this without hardcoding it to be kernel-specific.
>
>Why don't you just weed things out by the commit date? You know that
>any backports will have a date after that, and that anything that was
>the source of the commit will have a date before.
>
>The author date will be fuzzier - because it might come from the
>email, but it might also come from the email *containing* a "Date:"
>line. But the commit date is reliable.
>
>And by "reliable", I obviously dismiss people having their clocks set
>wrong etc, but that seems to be happening a lot less often these days
>than it used to.

We have plenty of headers in stable-related mails that you can filter by to
avoid that noise. Something like the attached patch?

It also fixes the issue that Greg reported earlier in the thread:

$ b4.sh dig -c  cfa1a2329a691ffd991fcf7248a57d752e712881
[...]
This patch is present in the following series:
---
   v1: [PATCH bpf 1/2] bpf: Fix overrunning reservations in ringbuf
       https://lore.kernel.org/r/20240620213435.16336-1-daniel@iogearbox.net
   v2: [PATCH bpf v2 1/2] bpf: Fix overrunning reservations in ringbuf
       https://lore.kernel.org/r/20240621122610.15083-1-daniel@iogearbox.net
   v3: [PATCH bpf v3 1/2] bpf: Fix overrunning reservations in ringbuf
       https://lore.kernel.org/r/20240621140828.18238-1-daniel@iogearbox.net

-- 
Thanks,
Sasha

--JzR/gZ5SxzllHGnN
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="no_stable.patch"

diff --git a/src/b4/dig.py b/src/b4/dig.py
index e5577a2..71e4fc7 100644
--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -25,6 +25,55 @@ try_diff_algos: List[str] = [
 ]
 
 
+def has_stable_header(msg: EmailMessage) -> bool:
+    """Check if the message has an X-stable header."""
+    for header_name in msg.keys():
+        if header_name.lower() == 'x-stable':
+            return True
+    return False
+
+
+def filter_stable_messages(lmbx: b4.LoreMailbox) -> None:
+    """Remove messages with X-stable header from a LoreMailbox."""
+    # Filter msgid_map
+    stable_msgids = []
+    for msgid, lmsg in lmbx.msgid_map.items():
+        if has_stable_header(lmsg.msg):
+            logger.debug('Ignoring -stable message: %s', lmsg.full_subject)
+            stable_msgids.append(msgid)
+
+    for msgid in stable_msgids:
+        del lmbx.msgid_map[msgid]
+
+    # Filter followups
+    lmbx.followups = [lmsg for lmsg in lmbx.followups
+                      if not has_stable_header(lmsg.msg)]
+
+    # Filter unknowns
+    lmbx.unknowns = [lmsg for lmsg in lmbx.unknowns
+                     if not has_stable_header(lmsg.msg)]
+
+    # Filter covers
+    stable_cover_revs = []
+    for rev, lmsg in lmbx.covers.items():
+        if has_stable_header(lmsg.msg):
+            stable_cover_revs.append(rev)
+
+    for rev in stable_cover_revs:
+        del lmbx.covers[rev]
+
+    # Filter series patches
+    for rev, lser in list(lmbx.series.items()):
+        original_count = len([p for p in lser.patches if p is not None])
+        lser.patches = [p if p is None or not has_stable_header(p.msg) else None
+                        for p in lser.patches]
+        filtered_count = len([p for p in lser.patches if p is not None])
+
+        # Remove series if all patches were filtered out
+        if filtered_count == 0:
+            del lmbx.series[rev]
+
+
 def dig_commit(cmdargs: argparse.Namespace) -> None:
     config = b4.get_main_config()
     cfg_llval = config.get('linkmask', '')
@@ -101,6 +150,12 @@ def dig_commit(cmdargs: argparse.Namespace) -> None:
         lmbx = b4.get_series_by_patch_id(patch_id)
         if lmbx:
             logger.info('Found matching series by patch-id')
+            filter_stable_messages(lmbx)
+            # Check if we still have any series after filtering
+            if not lmbx.series:
+                logger.debug('All series filtered out due to X-stable header')
+                lmbx = None
+                continue
             break
 
     if not lmbx:
@@ -111,6 +166,9 @@ def dig_commit(cmdargs: argparse.Namespace) -> None:
             logger.info('Found %s matching messages', len(msgs))
             lmbx = b4.LoreMailbox()
             for msg in msgs:
+                if has_stable_header(msg):
+                    logger.debug('Ignoring -stable message: %s', msg.get('subject', ''))
+                    continue
                 lmbx.add_message(msg)
         else:
             logger.error('Could not find anything matching commit %s', commit)
@@ -147,6 +205,9 @@ def dig_commit(cmdargs: argparse.Namespace) -> None:
         q_msgs = b4.get_pi_search_results(q, full_threads=True)
         if q_msgs:
             for q_msg in q_msgs:
+                if has_stable_header(q_msg):
+                    logger.debug('Ignoring -stable message: %s', q_msg.get('subject', ''))
+                    continue
                 lmbx.add_message(q_msg)
         break
 

--JzR/gZ5SxzllHGnN--
