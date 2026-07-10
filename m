Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9015426EAA
	for <tools@linux.kernel.org>; Fri, 10 Jul 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699497; cv=pass; b=lK1pypx51hmg/XYKtT56jMLivTGIzu0EoTybuRXP44nPgdLT1ZCd9KzDumywZIHZCO+cmOXQOB4DiBmH/GQHgiaQw6o5iYt+XmeyFd7nT2ZDpEFqwLsmp44JKc+NKZJ4NcBSF/ozXlKUroMexnd1jEIZL1Y5h/snAP8+M4VM8RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699497; c=relaxed/simple;
	bh=AGacCpHzoPkmGKwEk5kzINcCiBxJsOg8KI8AWYtsISM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVq1X3hgMuOdD4/ZF1mKQBwYmm70PQTo6BQVdRUxmb6UqYqMi1oWpZa8hicXcWixfWKA9CX3AKLxpdTgSaDWB4y4H4WZMPcjBMX8+nMt//WRD5xP7y+Kb/U2D5SAWVzLS/uXJKsCX2gbOazPwxqvgN7Mdo5yMAYg8m0PWNR2VL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UqUFb3n0; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UqUFb3n0"
Received: by smtp.kernel.org (Postfix)
	id 4ED171F00A3D; Fri, 10 Jul 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1783699484;
	b=11wkkzBORQi+qQNFEK4qR9WRosZuRaBulTbV7oWaqmoI45MJ/dl7/SlwWOfOjP0QhlBR
	 RK7o+kTbVVQGjUHvxz+FCFs7AB5dXblK/agte81wzwyDOy+IApDVhTcFGsKxx764dLqHy
	 LFkWyj2dddEZzfGESk7mT9waXIr2rtEJLFstEHnDJG4ygXUDpUeJAyhRbjCRroEDy3da5
	 yiuwoql5pxwPMJEvwSoYhhs1pY79bAJNlx+YEGodzuBknMlBB2fYXmK3vVvhxxTj2hPEL
	 ay3IdqmXIp24kxMKGUqIHdNY9Z2569DzSI761SRu5QoXe9vzSiu/Uo7sTwj+brQNW1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783699484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TpN2qCO4RO2qAHjhjwSPFNDqM4f8mORPcgZJEfsrZ5I=;
	b=sG79yBsakabBXNNSaQaDAffb3N408Ldd3nAYblh1h1Xr81tCl49Ur5pMHbhwJHoZcKws
	 rpn9KVhwY7tbFs6BA0fnDx3UjXFSQsYyRHXQMmRna0wd2sd93WGzNU/ATz0AEDHBGPgTj
	 gZjYUC0Zeb0bxnlhTgCdKmvbw1WUawEyq0DWkCO/4CDZl76lZiM+dbzD2tSDfSaMWxgIZ
	 vhZhFKu/CecYtPf3Yr1B1ToXw42j19feVuderovwdDqJ1M2XE19Y3aCSBnV4Mo/Z7XuTy
	 nk5dqovhO/nH1PcvTfmUgbTZfYdtejJzCUlUk0j84IffTh7cKYpUjLQ1YUhJTKQkMKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UqUFb3n0;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3B2D1F00A3A
	for <tools@kernel.org>; Fri, 10 Jul 2026 16:04:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UqUFb3n0
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D3B2D1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15ea93028dso123928266b.3
        for <tools@kernel.org>; Fri, 10 Jul 2026 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783699481; x=1784304281; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpN2qCO4RO2qAHjhjwSPFNDqM4f8mORPcgZJEfsrZ5I=;
        b=UqUFb3n0GlcmLQQDM4+cPkHjmxhlbNgFYSljXJ1eITAHGUPrWHUJRNJMVgjSCb5RDh
         z8HjWJ7as/m5U+aek/T1ZMImz+Ks443S4OdwqW7FmRI4WMuey7Sk8sMu9O6eN6+JXYvz
         Ia8SulsDPQa7lMYs79TjKcpNW2i03U8XK2R1hi5ECf/+bey9tvdEY6Ao/5qQcWGotKzu
         TWBdK57IoTZ13L/Oic31+NiFmJMooGXg4JZgKOICVI+u94R4yp357vJ/tGOlIVUavLso
         rSKi9iql29QRBCZc2oaZW9SxrMmufS8dfnXSSyrsky/M/F7rDytMwjY+MIflY+DRl3rZ
         tSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699481; x=1784304281;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpN2qCO4RO2qAHjhjwSPFNDqM4f8mORPcgZJEfsrZ5I=;
        b=AnicsvZ/Dwy1FnnN0zx7EijLSNYCo21CgB2dRrhe49XRTFzCkVxECr/oFn5xeZT21g
         KP5I8aCIggu23OTqQpWaL6zLKqd/med/6wOLQ9mfUo3ljtrPRTWEz7PV9AHkhOZ4CsYI
         7M2Wib8EO3ZZN9urzAKQcqF1xfVPcLpF3KMSZquhVCgeYt2uKpNJjN13h+2584L9gPdS
         X1Yo0B2X5YHcuUYNyfg76Bfax21V1ehQGnNE7IxR/W5dFpCN6mBhPcb5bAc/KUTV3ITt
         vTMdqRSzA4V8HYjP8eK4tRbL5zm0TLK2Xj+hON1wlZDo/xWulTt4Ld2AC5Ww4WCjwqh9
         uHfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VIKxy3H7dMeF3Fhf2xJdHGy9DbRb0PAUsLXJntTvPITxzZK+I0euBZyqE9IE5atpjydarbQ==@kernel.org
X-Gm-Message-State: AOJu0YzENzvYIG/vpjEIYkfgWTMu0P2XGnvwnkm9M0/7gEWvkevvNXyY
	8GXEE4LZqHj0jelMkt+XfQ7aWv5AJQb9gqmtkFE7uLgkqlKOsWh6XCXEWRxJ4jISSnk=
X-Gm-Gg: AfdE7cnpso8mItXFutR4+6Wuti/biiuNom5PsccehFZ0befu7HtdXJVQekwwz5THX6x
	bk9WXke3wH/Br7os2WtYZR7bjUZgOJXgUrxCFHGB8RD+JIlvkZBAYkFGArMJwOhcXz0ZN1yO8DZ
	1LXG2rkEtT/6H42ErVUXRmYYEOANAORvRTAQY5oKZYQjwRn3JWu3WFmalPTBwwpxk84hanIZY7s
	M0SqFnKMOYBUieeurhtTOMS3L4RaBbPHFPiYqTqkSavizJSmenXtoVIrLhupSH+zwlXdKsOQJIQ
	67gqE1dpoAjzDeldYu5FdHoF75y1yCL793JYnws9+J1iY9rpgWefweTUqswLXg/1ttSXAhA1zzD
	EQcbcfz0jR4ZTQ5bFY8U6JndZ3OOjgZVsoD1dAJg+pq80fwT0+B+qhKUDwwBxQhYn4He4EOtWHw
	K02SlGyr8K0ro8QQzhpEL9CyRMRiuXvsyonKXHy5utR+WKqrXn+4eEwLqihkqqT3HduqoKdIOy0
	55s73cV/fFNpOtkEMD30yJyD2CQh3oirnglJG0r3WAN/K9taAaO
X-Received: by 2002:a17:907:78e:b0:c12:b225:bd0e with SMTP id a640c23a62f3a-c15cdec897dmr517509466b.9.1783699481078;
        Fri, 10 Jul 2026 09:04:41 -0700 (PDT)
Received: from ?IPV6:2a02:842a:9b20:d01:a06b:e180:2ea9:f6eb? (2a02-842a-9b20-0d01-a06b-e180-2ea9-f6eb.rev.sfr.net. [2a02:842a:9b20:d01:a06b:e180:2ea9:f6eb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d5de95e6sm393712966b.39.2026.07.10.09.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:04:40 -0700 (PDT)
Message-ID: <74f0e494-10e4-490a-bb3e-94efce984586@baylibre.com>
Date: Fri, 10 Jul 2026 18:04:40 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] config: accept prep-pre-flight-checks from .b4-config
To: Matthieu Baerts <matttbe@kernel.org>, "Kernel.org Tools"
 <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20260710-b4-config-pre-flight-checks-v1-1-ab16cf14a00c@baylibre.com>
 <a7e019e7-584f-4be4-bf15-c3ac51be8edc@kernel.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <a7e019e7-584f-4be4-bf15-c3ac51be8edc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mathieu,

On 7/10/26 5:51 PM, Matthieu Baerts wrote:
> Hi Clément,
> 
> On 10/07/2026 17:14, Clément Le Goffic wrote:
>> The .b4-config file is a convenient way to share project-level b4
>> configuration among contributors via version control.  However, only
>> keys matching a set of glob patterns are currently accepted from it
>> (see wtglobs in _setup_main_config).
>>
>> The prep-pre-flight-checks key, which controls which pre-flight
>> checks are enabled or disabled before sending a series, is not
>> matched by any of the existing patterns.  The closest glob,
>> 'prep-*-check-cmd', only matches keys ending in '-check-cmd', not
>> '-checks'.  As a result, setting prep-pre-flight-checks in
>> .b4-config has no effect: the value is silently dropped and the
>> default 'enable-all' is used instead.
>>
>> Add 'prep-pre-flight-checks' to the wtglobs list so it can be set
>> from .b4-config, allowing projects to disable checks (e.g.
>> needs-checking, needs-auto-to-cc) that are not relevant to their
>> workflow and share that decision via version control.
> I don't remember if it was present in this list for security reasons --
> similar to *-check-cmd at some points [1] -- but I do remember a bug
> report with the same patch [2] which has never been applied.
> 
> On my side, I think it would be useful to be able to use
> "disable-needs-auto-to-cc" on some specific dev tree of a
> "sub-subsystem". On these dev branches, no need to add extra reviewers
> from the "parent" subsystem.
> 
> We could then have this config:
> 
>      [b4]
>          send-series-to = <dev ML>
>          prep-pre-flight-checks = disable-needs-auto-to-cc
>          send-prefixes = <specific dev prefix>
> 
> [1] https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a1360385
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=219705


This is actually what this patch allows.
My usecase is to use b4 in a project unrelated to kernel process and 
internals and I wanted to be able to use and push a .b4-config file with:
"prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking"
in it so the pre-flight-checks doesn't fire for this project and for 
everyone.
Note that disable all should also work here, not tested.

It should fix the bugzilla bug though.
Should I add a Fixes trailer or something like that?

Regards,
Clément

