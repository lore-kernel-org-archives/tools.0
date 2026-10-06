Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BB93CAE95
	for <tools@linux.kernel.org>; Tue,  6 Oct 2026 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275272; cv=pass; b=egjTobiAwjn9ByY0mvKlqDgWQzot+OrXKOmeI8vBiI8N0LSx1sBIFO01v0OSWkRewcE4KKswxRTH/2wBVDQwzcUwkCa/fH7yPFSWSZv/5XU1DzycVrN/MP1c/O2J03+0l/h/QQceStdLS1vW17eAQZ6el3Y5fFx10TXE1yQSLMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275272; c=relaxed/simple;
	bh=VIt9UMHHVxJ4LM5r6H9DeUzHRv36oefmwvowjz8ElXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GG5nFc0/LxsMm/rW4va8hlgEJyM58/B4M/V9vOMFMk8qEriu48ghlsyf3UsO12yPYuboXzpsqIXrLsjQX0ulJ/pAbi1VY2HK4Dkcjm3OG0WjCPOEz4SyuKvYUQeJ5OA8WzvSWzzcFlh7BFEPAunCre9HUaqpNvY/GO/j/KInBSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T2gJXuIm; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T2gJXuIm"
Received: by smtp.kernel.org (Postfix)
	id 707E11F000FF; Tue,  6 Oct 2026 08:27:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791275270;
	b=VcAi/WPE6e/xrhALj9WQhifPajKMNRPVZHPZ0FfeCADZ18VXkMDliECJxXFxuP1Svgoj
	 DBWIzRnGNHCkGxbnyrnhdSJ0cAgdbN6R23FIObwW9mIeS0yznMGYFMyJm+Iy0R6mGFXAo
	 6pZbzsgty7EUEz93quV6OEIe4HW3CmdxQzl6Ug8J7zycRlqnP6CD/Ab5lQZjtKuEBgm70
	 Ml91SVx0f+eVd8Nap7AlSfabP5xdWFRDAUfBHD4H3GbjtJsCB08SYVEcMI/5PYqXytsDY
	 Od3XYWDAJWPaEOiMuIshKFZEQnHVZs5XICtdHiGZbEOw62xzue1U1sxHlx/DNwup2uA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791275270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=m5lwr4EE9yKrKSEMaibS9+eoFKTHvFxeGuR4x1E5N7w=;
	b=ApZ6RVfN7yxG8ozcAHetqRjlL6EOhP5tHSqN+/boC/UojBVnvbt/9llfBIXTcrmmGcet
	 qslmKnG9pYkAvGUFo+sJyeSXYJ3MKZ6YA6Q+Up4HLVEwqqPBngnlywgWz4Qe9k3Ey0Hcp
	 cxqannr/a4AtOofV+7HxoGxDkVo67YkB5FGhpU+GdppnKPfA8T38T7EkhLsV5Srt9BLsU
	 tbqHddjq6iofFwdIR8/6uHx692uOeksw9mafcJtDPTlAbGWOP0hFQqoN4Ub1Mfq6A9+4U
	 3oBGDTbZt1484AZC6gxNDiP5A0OPhrjmc6VDRR2qSVOJe+/J/+GEd5E/JTJF5Extj7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T2gJXuIm;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E07491F00893
	for <tools@kernel.org>; Tue,  6 Oct 2026 08:27:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T2gJXuIm
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E07491F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so28353075e9.0
        for <tools@kernel.org>; Tue, 06 Oct 2026 01:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791275267; x=1791880067; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5lwr4EE9yKrKSEMaibS9+eoFKTHvFxeGuR4x1E5N7w=;
        b=T2gJXuIms7gWzPGJ3X9fSKi9G7XgLdTXQzNx0epeMPmB2XinSzpMKdiP3qj8fCm8IY
         dL6rokvlbWHvj9g5l9/N/7o2lFqCwJTHrYuKnK/t82WdymqJANUCkw4TAc+od0fcUVbl
         WR6ThDm/SjrSXw7ucCM3mULNTZR7eqrK7Ag++RypuzH4AaS2Y/tXVBKQhtcRpd7BdL+l
         v/B6BUlHiV7BBtkv5FiCJ+4BWzpNYWXwby9lynutUS7DF+96HNZ40OoIOUmck8317M71
         KI2jVqIXUP/i/Ii4DwgYxm7C6O8qlvJGNKiJH7AQOkLRMr6COsCkoSZfTdPYE/jPznDV
         fAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275267; x=1791880067;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5lwr4EE9yKrKSEMaibS9+eoFKTHvFxeGuR4x1E5N7w=;
        b=Xs7//Yb/eoxLPtKMClSTFdaNcs9SgbeQ1eebLAoI48Unq/VQ4OQjaIVugOyVUk/QO4
         UYVp/rTfzs5oP4I98EZZbyzttWrXaphIFpVHS2lT02/ZCL8WNcyJXZ6YVRivscFmQySP
         smQG+FnkhT5cv6x+KwiLyYNgQqZWvHUOkLjUxWPIIdBZcN8+220mKdEFklDIH3EjGiOi
         wb4dE/EXd4mrBw2e92SUWs3Lx+v4b4GSEolYPExBBJyMKPvhGXzneZSmE4Qy8Gb+xdhF
         b0n3K3mP/BDw3j92qj/CZaPISz/z2pKmgbhmrCL88W825SnQPoGdZAArOzMbk/UoyNzC
         wTQg==
X-Gm-Message-State: AFq9FYKFURYQrkp5bUiEE6FcPY8wALATNSkoGJ+qpEuTSmNKI2uA6lzT
	W9gfWHQpsWJ4CFRu77MhTgdlyhDy5b9RDCEkw/93GX4hGYPsxgLC5YWKiYO9gXq0ZAA=
X-Gm-Gg: AYBFou2gyV9EHToezOj0QVabRqtZF1PxQGnEu/H7ByE2gH5TpvFs50gGeLUbzU1542V
	9mrmAK4pXr5YdLXnIY77UZT5lf6pNSJVOXwS5TjXDNsWQTDyw7/hHDcouEAN+y227XiQktdSGf4
	QGEWF9IA0K4HKWLzyLVASnHYS8lE8kYbMm4oj+8VWhDxdd1W63BNYEp7zS+Tj9zmJhAITrH6l31
	DdHzMdhdaQWzA2VSkDZsL9Nbqqadi72RSvLNegigZrMD8CtpmR7+y2uHdCLkUv8ZpBZfHfgIoQC
	ui5/Xt2AscH7LxrjFJhE1N/I6tqkqBRyMRJwvtlKJ6zm8iLFOuKV75kZB1yuTYJWkrA54HmymjU
	GBat+062R3ku/kAV2V7QPIZBIz10byl/dVumnlC+jM/+jeiEUFixQSELwVDHyKvmbU289XapzGT
	qh3ZD9siEr2zoWdnGqFbz+2LGEtxF8UpLPfgwp/0gFjQU/fpGZ1Fra8/Pj2IHoDpkNJGEri7S2l
	YmK
X-Received: by 2002:a5d:64ef:0:b0:48b:948:c720 with SMTP id ffacd0b85a97d-48c47fe7a2amr19445498f8f.11.1791275266875;
        Tue, 06 Oct 2026 01:27:46 -0700 (PDT)
Received: from [192.168.1.62] ([37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622d282esm8470084f8f.33.2026.10.06.01.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:27:46 -0700 (PDT)
Message-ID: <a1a1f7aa-dde5-4a9c-a3d1-6377e36b3ef2@baylibre.com>
Date: Tue, 6 Oct 2026 10:27:44 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 3/3] lore: stop a less pager quitting on output that
 fits one screen
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
 <20260925-b4-lore-fixes-v1-3-103fd9507e67@baylibre.com>
 <179119498922.1802901.11622089083955121536.b4-review@b4>
 <01c5b15f-7f4e-4620-be36-bddaa37255d6@baylibre.com>
 <20261006-watchful-subtle-snake-bebec6@lemur>
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
In-Reply-To: <20261006-watchful-subtle-snake-bebec6@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Konstantin,

On 10/6/26 9:15 AM, Konstantin Ryabitsev wrote:
> On Mon, Oct 05, 2026 at 02:37:11PM +0200, Clément Le Goffic wrote:
>>> Would this cause problems for people who set their less env to different
>>> settings? I'm not sure I'm comfortable blindly appending +F to all
>>> possible less invocations.
>>
>> We were already removing F from environment variable before this patch and
>> to me it wouldn't interfere with people settings:
>>
>>  From `less --help`:
>>    -F  ........  --quit-if-one-screen
>>                    Quit if entire file fits on first screen.
>>  From `man less`:
>> The environment variable is parsed before the command line, so command line
>> options override the LESS environment variable.  If an option appears in the
>> LESS variable, it can be reset to its default value on the command line by
>> beginning the command line option with "-+".
>>
>> This let me think that we might not need the env path at all in fact...
>> I'll rework the whole patch.
> 
> I applied the new version, but then backed it out because it broke things for
> me. :)

Oh ok

> Fedora uses lesspipe.sh, and +F was putting it into "follow" mode that
> resulted in a screen full of "~" marks and "Read error" at the bottom.

:(

> So, my initial reluctance has been confirmed -- there are too many possible
> setups out there for us to try to second-guess what we should be trying to do.
> It's best not to try to alter flags on the fly and let the users set up their
> GIT_PAGER appropriately instead.

Yes I understand. We were already removing the 'F' option in LESS, I was 
thinking that this was also making sense of removing it from the command 
line.
Should we drop this LESS special case?

alias b4='GIT_PAGER="less -RSX" b4'
Will be my solution.

Best regards,
Clément
