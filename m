Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4643F2115
	for <tools@linux.kernel.org>; Mon, 15 Jun 2026 12:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527989; cv=pass; b=FeHiA9pBxCUFdlyxiNSRctCQAmCh7OkyDjZoAN4DSPTN1N/XrOvHJXspglwkgsIBxydNRK144WZEs0e2pvyiwMQVScywUJZYfNGM9THLcQLZmni+MqQai71m9QTT96XD9uQwabamM+th/HPKstSTLkaBfW14jw3XuSR/D80V4Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527989; c=relaxed/simple;
	bh=e34WEzhiUx2ZrtuOJcFCN30OrS/OtBzeB3OabfA0G8A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=WURZvtfwerCGq9KLqZBIpYM6csqANFs4N2TbtazbcdPpVPHiojc6USH72sYe2JmEhKquUjUhqOdHHqg1O2vSskulnO01S7AmWQZBz8NJq4UijrodRK7IijtB+C8zXEXFCfp7ArfglpT/xtUagSnxYpcGcjaAOFyBxakdCZ1sEgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KWYVJUJJ; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KWYVJUJJ"
Received: by smtp.kernel.org (Postfix)
	id 2BFA01F00A3D; Mon, 15 Jun 2026 12:53:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781527988;
	b=JC2kYQjRSjJo+xsUl7ektwTEYwULCpl/9Y1V6wDnOjrbgHtSw3t2qMAx9QMNNtn+m9mI
	 Z7ePHAg6QXomvhQEpQXWYlbWXAi+BpapBlXYCUmuP1REBecbuEVk/G1gHJj9FLxYV6VGr
	 t27WuHMXIMZDAbmzcb+btEfuo8oqo5R/btB3HVh20Ooc6GrtbCu66EyhME11wQVKO7WjD
	 JkEGKypeuvzj4zhlrvqHfF2a81FdQiGA077OT3Iq1oK8UJK8/t+2SQ9isL8Miz8FoZFUl
	 ORzIMB9+s82+f86ftsA6U53WicXBYwfDde/nMmUQllz/7ew2vwNhmnbAK1ulx7UoXZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781527988;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:To:From:Content-Language:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=hR0LDmcBZIq+HGLfXA70ZtNMborxb5ucr+/sV5L3aRM=;
	b=DcrP2EUQd5ThzzOT1MGSvCVcy9pRVEHzHvYii8OE7wsI05PkC4TyMlFuxedbYcGNoqwR
	 qDFhtEw8bQjRCLG2p8w5It8OMp1S/yVFhC8zOzLPNsId4fi+H6a8XnuDSFWI5p5XhMejp
	 5tD09FL0Tn1oAK8iWGaPBQd9Dj6awBGuzRf+VNFQmciGdrMC9UOm9FCJQxv3nRklRS6u9
	 qNcz855Bba66X6l8Rr+lCLyD9A/Ns1+9PyYdiUYXFHgSyIIFqZ9ewdbhNvsy6KVUqpEnL
	 nq33bv6q0TNjezPMz+lodU8xzmK8zEOjqBnc5rXJBrgcBHAQd+8slg9iAgITL14CmBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KWYVJUJJ;
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 748841F000E9;
	Mon, 15 Jun 2026 12:53:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KWYVJUJJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 748841F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECEA5AB4;
	Mon, 15 Jun 2026 14:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781527947;
	bh=e34WEzhiUx2ZrtuOJcFCN30OrS/OtBzeB3OabfA0G8A=;
	h=Date:To:From:Subject:From;
	b=KWYVJUJJHaERYAaPvwNFklhawkyLmmZa6dd1CkVe9fCQndZtyRbpZU3BvA00Fg8op
	 VeQCwcwXNyyml2aHJjt+s7sxTAvMSNBpYfu54iOjyr8S2KBucXurg+8XZfoDxHBdWy
	 zBwgPX5RoJ+O1l5I5F0EOjCT5Dk3HmLxGmrya2tc=
Message-ID: <3ed2080e-c8a2-44de-b68f-4b23338a572a@ideasonboard.com>
Date: Mon, 15 Jun 2026 15:52:53 +0300
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: users <users@kernel.org>, tools@kernel.org
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Subject: b4 fails filter-repo with FileNotFoundError
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm seeing this with a few commands, I think at least "b4 trailers -u" 
and "b4 prep --edit-cover". Linux mint, b4 0.15.2.

$ b4 prep --edit-cover
Invoking git-filter-repo to update the cover letter.
New history written in 0.07 seconds...
Traceback (most recent call last):
   File "/home/tomba/.local/bin/b4", line 6, in <module>
     sys.exit(cmd())
              ^^^^^
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/command.py", 
line 512, in cmd
     cmdargs.func(cmdargs)
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/command.py", 
line 85, in cmd_prep
     b4.ez.cmd_prep(cmdargs)
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/ez.py", 
line 3145, in cmd_prep
     return edit_cover()
            ^^^^^^^^^^^^
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/ez.py", 
line 885, in edit_cover
     store_cover(new_cover, tracking)
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/ez.py", 
line 749, in store_cover
     run_frf(frf)
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/ez.py", 
line 157, in run_frf
     frf.run()
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/git_filter_repo.py", 
line 4936, in run
     self._record_metadata(self.results_tmp_dir(), self._orig_refs)
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/git_filter_repo.py", 
line 4767, in _record_metadata
     self._compute_metadata(metadata_dir, orig_refs)
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/git_filter_repo.py", 
line 4648, in _compute_metadata
     with open(os.path.join(metadata_dir, b'first-changed-commits'), 
'br') as f:
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: 
b'/home/tomba/work/linux/.git/worktrees/linux-renesas/filter-repo/first-changed-commits'

I'm not sure if this is related to working under 
"tomi.valkeinen+renesas@ideasonboard.com" email when in linux-renesas 
directory, as I don't see this on my "normal" linux tree. Then again, I 
think "b4 prep --edit-cover" was working fine on linux-renesas earlier 
today (but "b4 trailers -u" was failing), but now both edit-cover and 
trailers is giving this error.

  Tomi

