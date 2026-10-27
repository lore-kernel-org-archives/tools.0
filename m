Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793092637;
	b=3IbYxOT2JcCWLuZd0c1QoGNmAe6pcPA6iLyTGMwKp/yiyhvwdhYxrhpDxJcb2ADCY4kd
	 putlHFjgOmjkftlTD/qW4NrHkX8vPEJR8uRdJcGX0BHnz9o8GKuoAp14aHvQs0Z6/CZie
	 L4ZuJ4qD4J7peP58gW/6WyhEpIlc+UfjoN0ckzmd5WSsUZXv/UHszKlYWM55Jz5AyayxJ
	 RKxhd+v2QBE5Vaq35fpLi1LHiLm5pa06GAyMvrJKCAL1Z4K/xbA7SVCLoYw0g9KwFBHlX
	 hEpq7T0kV+lamBmVsOvEBMGzhmv+QyRvE8/2CxWPQjt2vtetv1vX64kwNkFoiVxbDxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092637;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eDyXUHHIENjEzdWwj5qzVVkz/tvWfiPGgtSNk1UNUFw=;
	b=AjVI1/Vn0EM86hZgeNYJTFMTlTiAr6TwMB3xBjwgy6jRXkFPgoMgbStLjCactqGjCPMb
	 mZPJl9LuyUL9WCjHi4ASUKFLWROjkvToDPcFuqsp8GJFwPWzYN8Dot9zcywnULa8Dc7vq
	 O13SALJSk2fH3AVG8SDmJFqrF4ci75z4VYM6/Acx06RlZAz7mZTZ3A0ni+h5SXnS9OgXH
	 gXqfDEal7r69Y0TwwaMl3/P7+ticHqLX51eAnEzGuIzSCHX7NAhT8J1SZY5AJGF8wECBP
	 iUtNZ3nwIntB4g1rCZ/6ZOkwoiKL1Hjsj7brXsAteTTr5P8USgTaQgH4aymBO+/kxnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JRZ9ufaC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5C606A31E
	for <tools@linux.kernel.org>; Tue, 27 Oct 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JRZ9ufaC
Received: by smtp.kernel.org (Postfix)
	id 1A7B11F01828; Tue, 27 Oct 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793092637;
	b=zoj404gRSv1AQk+5Oh6IJ3jX9aWWym0JiXz6IA10EcNFKLd2MDfntIkFTU9q4OzHd0o+
	 d4+vwyqtRXgos6q2SR/cGU6eCm7GRHTIV47qKxGbYInGMAbCKZW2XYFeB4p2ecQQIK5qB
	 jY+RV68qzUCxJvw5AiiIsRdoEplji41bxS0R9tAeFDrUR28ynfGAQD1qf/QCG68RKjqjz
	 v8mSocjyDuOREujGt2I+B2jm32DqFjgrX/feAg0HtPk6O5qYlUAaV/RPi9S+eu0+XiVj/
	 4LG9LDMGi/QS+GXWnvVv5byWbEb4F+4p6gKk34mdhwgxEN6jxHUV8Q6UGAq9RhJADYQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793092637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eDyXUHHIENjEzdWwj5qzVVkz/tvWfiPGgtSNk1UNUFw=;
	b=mO1eejavU4A5/zCAzlPsnDnbURarobbFDOB3V+Ou0ikQHO67YfS+Ct/sf8zPt0j0DkdS
	 4tVQrsU509Vd9Jm6KchErlTXy0pjvkd/F+k1AI7Xl8tgXgyq5SPOAhwMVAZUnx8QmXrMV
	 Pjpkb7orfdGTKYYUvbk+kqj/vr6H0w6ltcPk3jNyo0PgkJei8Q/+SETnHoVq1OxUVWxUP
	 ge8rSohMrl1JRARJdUysHSr6dBBmcUGa57d7Z0SA9xyAH3yAY97i4bmZpt5v0S6N4p0YR
	 04O1x1jCT+4LT05zC/+gHPZI1cCpv+HpImIFsP4hLFhLr0Xs3IwFZ43u82rubw+VLag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JRZ9ufaC;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF5941F01825
	for <tools@kernel.org>; Tue, 27 Oct 2026 09:17:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JRZ9ufaC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AF5941F01825
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a208d93758so44590715e9.3
        for <tools@kernel.org>; Tue, 27 Oct 2026 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793092634; x=1793697434; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDyXUHHIENjEzdWwj5qzVVkz/tvWfiPGgtSNk1UNUFw=;
        b=JRZ9ufaCE2yajq8o6Hj5JRuxcSsgMPP2G2fGfJ1UoJ4Ufj5b6QqrbUlTdAZuXi2Xpw
         oWGcRcPs26kDQww0Sv5XS7OkgzPR+hGWZhrP+2Pb1HYbzaE/T8OdSbsEBFsXbcLMcF1B
         Od1Mu9lB6EQhMsqCYteODoA9nYTnpKmp2Tv3wnuytKQ+rJz3klqca0qVWohNENpSm7B2
         72nA4VkP9Ido+JhcCXEe7QNOxqkRCSOU5rggYPRrG1PdZCc19vO+vNYd2RuW/MNoh7xD
         hMGP/bnQEkTeWDEBVLPo6pm3o0emCmrBfl7kqdY8uOKaEW5fLAnmmc0Yj3V8dhn53fo/
         S3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092634; x=1793697434;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDyXUHHIENjEzdWwj5qzVVkz/tvWfiPGgtSNk1UNUFw=;
        b=RRC2BhTjFRZIXIj+Rn+CwUBEDW/6OOwf62gNGZZqOz2E99mEcdfEMIktSy7mbqUqKW
         JAGSmRtJlOg6sOUml3YYn+EiZJNRUcq2OrLS+ygOKjNZwyiRP95PVTX4Rs/1gjBOcxh4
         vuWc3XDLxuLZhgVTBKsTmUoyCkD2NVS900lApgoFyDEoXK3VzV/5Kh0cxDNWi9ZkRBKk
         /xzXqxgX2Qrg3rosPyBvR6SBAXkbVfkITihf4OlFhI4pM5pkMp6gUSYlNZERFiJrcuiO
         aPmLVUYpRBFF7spdL3lwr9APXqGghoZeD9wTttnAqmmttCOaWaIDygDNhYMKYe1sT98M
         ee/Q==
X-Gm-Message-State: AFq9FYLOLaihY47wky8AyPcUJVzj9pVvDfYhInfW6FKNRuDv/L1UZBDX
	8NjS/g8rT48JjHWgE3HBUXCDnr159mUn+fmuQPSDRjEnBV0cS5MuT987dRcJSP2e/TWELv8PEcw
	fZCEfhhEvGA==
X-Gm-Gg: AYBFou2EWTXDVdZ37coJCek0JDGIoPSNb1u0Li7POhyfw1IwVdrH6rxc9VRQa86CEKB
	oxg5ivAvAnPJiEn3Cqlo2ZsXANpJIq+mXzvdYxTfA7pbepsY98rF2B6hf9nnhvpDm6Cr0u1hD/e
	kn3DspId4LIiJnhkLl5P+fS3Smeq1sBvaW1moMay0MVnQS0tpmSEl3AzN3Zrr/x6YBtszq61MGT
	amAuJA8m9fRTqyd9Z3M4BBUbN7QHl+zmbtw9vjp0My84S8fNZQZETJ9ApH1pjKuiNMgw9odkwxE
	NVJSIcoo1jQGUQKoHj6tsOvFw2HMXlmmSzvAFKdxGHyTQoR+K0XrV/ujU+B6L0Uf3bV2NkJkp2H
	VC8UfQ+yq7MDRGVLuiw7AApaZu6JFiS4vS6qhvfp4zsaqSSJD3SUZQrTgHBQhubLovViagt2xjf
	Zw6DTnFICWtJ/jSV44pYIjctbb8Ky40+JV19c7bCe30R98alVyQpH0HPQQKAMF2C4EtUv2WUvCF
	YJroOZNukonZMqR+aKElqXenXC3iGkKhJNvJY0mmdrWuzz3sABVKfO3883PAT5+Jk9dXphuCOPc
	zpP5cr8n
X-Received: by 2002:a05:600c:3b93:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4a35acb0791mr189291945e9.28.1793092633890;
        Tue, 27 Oct 2026 02:17:13 -0700 (PDT)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bb112sm271855765e9.8.2026.10.27.02.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:17:13 -0700 (PDT)
Message-ID: <dd3b74a2-4f49-45fe-b708-139b7990b242@baylibre.com>
Date: Tue, 27 Oct 2026 10:17:13 +0100
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 0/5] review: fixes to track and forget
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
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
In-Reply-To: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Konstantin,

Gentle ping on this serie.

On 10/5/26 7:45 PM, Clément Le Goffic wrote:
> These are standalone fixes to "b4 review track" and "b4 review forget", found
> while working on reviewing a local branch with b4 review, which will follow as
> a separate series:
> 
> -a failed retrieval ends in one error line instead of a traceback
> -`--offline-mode` no longer contacts lore when rethreading
> -`--no-stdin` is respected by track and forget
> -re-tracking an upgraded series shows its live revision instead of an
>    archived one, and no longer suggests "b4 review forget"
> 
> Each fix applies on its own.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
> Clément Le Goffic (5):
>        review: report a failed track retrieval instead of crashing
>        review: honour --offline-mode in the retrieval
>        review: honour --no-stdin when tracking looks for a series identifier
>        review: honour --no-stdin when forgetting a series
>        review: describe a re-tracked series by its live revision
> 
>   src/b4/__init__.py                |   9 +-
>   src/b4/review/_review.py          |   3 +
>   src/b4/review/tracking.py         |  70 +++--
>   src/tests/test_rethread.py        |  55 ++++
>   src/tests/test_review_tracking.py | 622 ++++++++++++++++++++++++++++++++++++++
>   5 files changed, 737 insertions(+), 22 deletions(-)
> ---
> base-commit: 7768e1d35ae5e11c79175d6efb4083d57709b690
> change-id: 20261005-b4-send-b-4b3414d35e67
> 
> Best regards,
> --
> Clément Le Goffic <clegoffic@baylibre.com>

Best regards,
Clément
