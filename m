Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC943EA976
	for <tools@linux.kernel.org>; Mon, 15 Jun 2026 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528210; cv=pass; b=nFumQWjkg9u7RJyldkviK0hnFago5ozJKxNlBrYQcwQSWYcUslxFUcrBchWYaFLeGKkyfH/lQ24XO/fSnnEREI6lOyXOAEJLrOap+z4Q7ZbD7PgEiawj4V8JRxsAF7xno7EG6U9cpENkrHivJp7yCeeP1P35MxUvwQymf71Wwmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528210; c=relaxed/simple;
	bh=FCQnyem150Oiq7Llt9mPQkHXhrgPkRrpnab2R98xZCc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Yuoi+D5hG/1QWfMSWpEmnG4ur78S8FZiqUKXmDecm0nEV7KqndRMvFNShIjjsqDQswylpdmGM3n3nJ9CXvTGndtbW8Q4zkSIudaMVLLngaPlnCgy2UrKmee4SXgI2ypQZMNpBrjLyodShPfqbIk3jMU01lvu+JmFpHAP9tiqPOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PGgr2//+; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PGgr2//+"
Received: by smtp.kernel.org (Postfix)
	id 704081F00A3D; Mon, 15 Jun 2026 12:56:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781528209;
	b=VPpm8lmz26OcFi+bO3gkTLXSH6OyAPPtgQYUflBRJJG45uF8cTrlmnzvNneMz9q1CMSC
	 vg8yrQCdUQwdOCa6hJUEMycpYpTo0LaZsfQrlfvC6jDNPYog1gMTmeNTScPGiM3wmMIhp
	 pmAu40KOWr2lJZAHsLPAvhiHJ6T4InjHdTpQmVw1VGnLT7A1hR+Ig/6579Gp1VdLGP+u7
	 j6EPeYcq8sjsG872OCIWQ5jJBJsK+EZF4iIsoW89AWnSzmwEhf5Nlf276kSPqwiofi2Qh
	 UFO1/dATzvoRcOG9Z7oPVRrjA3ftfwgmMZWidWrgefENDt1T6+eGj47RE6N5U1lyEAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781528209;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XdAQGB0RG7GQsjh2bn5MqXmOF6fSv6Y3Y2C1MaPYiKI=;
	b=JNnq4QuAuyDA3o557JviLnnAtJAGmBSVKXJGJDmxJ9ET6SrPB4UYg0V0djcCWSud2n6W
	 IuHsYp1N4qP4rdYYMQtzQHAQcEJgkqZybmRZ6DkTTvAwLFoWOCJL1wAR2MSfPD/p8p5wl
	 RmHJXC02d1Xa4CzxYSiFNztLCucj+mLKjuw5voXMt5abLfNqaSbJSodnHH+x/98KgUkRk
	 pbFBQHE03D88rQwXT5xV83856mDi09L037r/4FWO5sOnXbAWKiBshEU/tUqhw0wdSq4QG
	 +yJyvTI9MWb79xRpm4o9y/E0oqL8kUrzlJnCRTNeNS5Rwb/I2SzJqjf6cFy1Jj2kfRA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="PGgr2//+";
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD6221F000E9;
	Mon, 15 Jun 2026 12:56:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PGgr2//+
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BD6221F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77D91227;
	Mon, 15 Jun 2026 14:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781528174;
	bh=FCQnyem150Oiq7Llt9mPQkHXhrgPkRrpnab2R98xZCc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=PGgr2//+GftePSHBpnhhRbe3ncaSF9Ov1fTHDF6s0HBhRKZPCs1dmuY1iEIIIXP5h
	 rWpm2nrRt7+Y7yfpphpt9F+5zYUto3BTYYzRCG8Kf/47oLS0zhY4tjWx0IMyEYKsUM
	 B/hkElD7rVtYe25m7dVZPchrecgeodNzTrVyfVxA=
Message-ID: <3e701168-4671-46bb-9423-03921038b378@ideasonboard.com>
Date: Mon, 15 Jun 2026 15:56:43 +0300
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 fails filter-repo with FileNotFoundError
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: users <users@kernel.org>, tools@kernel.org
References: <3ed2080e-c8a2-44de-b68f-4b23338a572a@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <3ed2080e-c8a2-44de-b68f-4b23338a572a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15/06/2026 15:52, Tomi Valkeinen wrote:
> Hi,
> 
> I'm seeing this with a few commands, I think at least "b4 trailers -u" 
> and "b4 prep --edit-cover". Linux mint, b4 0.15.2.

I forgot to say, even with the error, the actual job still seems to be done.

  Tomi

> $ b4 prep --edit-cover
> Invoking git-filter-repo to update the cover letter.
> New history written in 0.07 seconds...
> Traceback (most recent call last):
>    File "/home/tomba/.local/bin/b4", line 6, in <module>
>      sys.exit(cmd())
>               ^^^^^
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/b4/command.py", line 512, in cmd
>      cmdargs.func(cmdargs)
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/b4/command.py", line 85, in cmd_prep
>      b4.ez.cmd_prep(cmdargs)
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/b4/ez.py", line 3145, in cmd_prep
>      return edit_cover()
>             ^^^^^^^^^^^^
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/b4/ez.py", line 885, in edit_cover
>      store_cover(new_cover, tracking)
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/b4/ez.py", line 749, in store_cover
>      run_frf(frf)
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/b4/ez.py", line 157, in run_frf
>      frf.run()
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/git_filter_repo.py", line 4936, in run
>      self._record_metadata(self.results_tmp_dir(), self._orig_refs)
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/git_filter_repo.py", line 4767, in _record_metadata
>      self._compute_metadata(metadata_dir, orig_refs)
>    File "/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site- 
> packages/git_filter_repo.py", line 4648, in _compute_metadata
>      with open(os.path.join(metadata_dir, b'first-changed-commits'), 
> 'br') as f:
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> FileNotFoundError: [Errno 2] No such file or directory: b'/home/tomba/ 
> work/linux/.git/worktrees/linux-renesas/filter-repo/first-changed-commits'
> 
> I'm not sure if this is related to working under 
> "tomi.valkeinen+renesas@ideasonboard.com" email when in linux-renesas 
> directory, as I don't see this on my "normal" linux tree. Then again, I 
> think "b4 prep --edit-cover" was working fine on linux-renesas earlier 
> today (but "b4 trailers -u" was failing), but now both edit-cover and 
> trailers is giving this error.
> 
>   Tomi
> 

