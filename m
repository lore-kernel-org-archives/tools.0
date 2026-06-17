Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AD524A05D
	for <tools@linux.kernel.org>; Wed, 17 Jun 2026 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697765; cv=pass; b=uPQcsF+qk3S0E8R1TYgOF6jDXD6e9gaUo7RPTYqmXbhXy1kAY/SyWPCkpaOZ9vPRzU5O+UHWfpc/GV37lNa4Nm6WMAUOXuaIM6HO+gKTfkH6F9JnGMn8AfXbTtjLt/JhII7R452xSXdFxtyMm8AJO8tVIH1qjKjo2G5YG2DYWBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697765; c=relaxed/simple;
	bh=O5Z+zAEDu1iGdqReJLBib8lHSt9n4DjpGtVRideahs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecxn8yqOzVW5v3Pe1n+BwVZ0NuJDBQUArNutnxPtPvy9jLWTMhpdgqIoGC4h6eP7TQCBi/YYQ80qA0hfGl1woQ5LoIL7VbU5aU4RRdTeJ2+4zB3MRQllTMykQbxJozwp03SjKCTLT1BJlfEj+bWUabTuTDVkpsuJYU+9geKcDMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K368SCc6; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K368SCc6"
Received: by smtp.kernel.org (Postfix)
	id 0B6961F00A3D; Wed, 17 Jun 2026 12:02:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781697763;
	b=wa/4wIDVJ2PMjA1TFyf6RSrOKAyVYAUj3I6rFotnWiGDi6y8a7g0yDQDhvMX+VagIgpS
	 qCOgdBMLL7leMasC0MEXv8aZ5XHo78O0uwgumLJu+0++yLOWf8U6sKXIMUBNNMVJVyfAd
	 biLMx6YchUn+bw74753TPMoGM95l/CwwOz8ZirQaygAq3NIsnXoBIZosUMo3GcToInT8I
	 6MIC+waZVK2KP83N4AP+UG5Rv5U2KiZRSzg2amxKnonXwv0HTYB9ToK8WYfivoyChFkKB
	 odrt62xnZIz4yv8T5NIB1FNyrswiIVNAX4wxWxjzaXBygFzDFCUkbguNI0ks/HmLlNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781697763;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dTr3KDpdtw3STxP1M0eo7y2vJ9kN6AAOYU1WBLlXFJU=;
	b=CIRN0msLOJSBzc+kZhM1yiwdFT4ltipcFmypYyGIKlT0zdbaYq2sBitYNjTaaoaIylxq
	 H0WvEhe6pcG7PqTpHxSYO/TtDr380e3s1UA2UHgjPS3xbJh52zXdha/02E0TOHSOYoOjV
	 J1VIwNMyJsrJIkNfAo+0URfBChjIuORCOiKAuWk3weWRzUCwrVto65EgBwu6Ct56Wyt0W
	 wCxqSp6mNbwtPEhXuW/VjVfucGomCvlD3CO0MgE8Mmowp8fxUkPlVqTg7FLE0RiBwqwFx
	 wIIzVrBR2OLIezdKlS9CQR112u5ptcEBXXG86yhRDczamCO5zWoKMUttR669tw9lXbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=K368SCc6;
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45E0C1F00A3A;
	Wed, 17 Jun 2026 12:02:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=K368SCc6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 45E0C1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74A372F8;
	Wed, 17 Jun 2026 14:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697727;
	bh=O5Z+zAEDu1iGdqReJLBib8lHSt9n4DjpGtVRideahs0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K368SCc6nVZtU6co8tw8lF7pYnvkT1FMNXPV9E6XQjnLRApC9FaVpNkLHFHXF9mKZ
	 JSM1nhoBTZ4VdapEL8ElrV6aLHYRbZUuDiaPtdkPU+a5cgIeRsvzU1hecClet3Fk5M
	 6PHL6TjhkAlisNUcBQrE5ZgnXXG9Ld6HlPG3WQlg=
Message-ID: <1ab61866-71ec-4b9e-bd3d-a0cd49856994@ideasonboard.com>
Date: Wed, 17 Jun 2026 15:02:37 +0300
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 fails filter-repo with FileNotFoundError
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users <users@kernel.org>, tools@kernel.org
References: <3ed2080e-c8a2-44de-b68f-4b23338a572a@ideasonboard.com>
 <20260615-tremendous-dandelion-kelpie-4aab9e@meerkat>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260615-tremendous-dandelion-kelpie-4aab9e@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2026 21:39, Konstantin Ryabitsev wrote:
> On Mon, Jun 15, 2026 at 03:52:53PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> I'm seeing this with a few commands, I think at least "b4 trailers -u" and
>> "b4 prep --edit-cover". Linux mint, b4 0.15.2.
>>
>> $ b4 prep --edit-cover
>> Invoking git-filter-repo to update the cover letter.
> 
> We got rid of git-filter-repo in the upcoming 0.16, so, since it's succeeding
> anyway, I'm going to put this on the backburner.
> 
> Thanks for the report, though!
Alright, I'll wait for 0.16 =).

Just for completeness, today when using "b4 send" I got a slightly 
different one (but, again, everything seems to be ok):

Sent 12 messages
Tagging sent/20250219-rcar-streams-1fdea8860e5e-v6
Recording series message-id in cover letter tracking
Created new revision v7
Updating cover letter with templated changelog entries.
Invoking git-filter-repo to update the cover letter.
New history written in 0.08 seconds...
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
line 95, in cmd_send
     b4.ez.cmd_send(cmdargs)
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/ez.py", 
line 2352, in cmd_send
     reroll(mybranch, tag_msg, cl_msgid)
   File 
"/home/tomba/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/ez.py", 
line 2491, in reroll
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
line 4712, in _compute_metadata
     assert(usoa == intermediate) # old wasn't pruned => usoa == 
intermediate
            ^^^^^^^^^^^^^^^^^^^^
AssertionError

  Tomi

