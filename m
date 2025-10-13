Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291602D24A6
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760394709; cv=none; b=J2/Mo5QpAHrOsw3PmsvQ1A58ekl0DCxLSEIddafH794maybdMpN7t5CscO8sPJxZRTdRvLxKl4nkR8BNXRKXVZCTonY2QJM2/pevEDcEF7xVso8n5l/+0k7D93nCXijuJysoNAdYwS1YgO5jXUPHJhrsSJvw3Y4RqZYN1qNRshs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760394709; c=relaxed/simple;
	bh=afHjh7RbfBmT9TdBQ+d+E7FwEOpA794Hq1fGcZLs6IM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=E+CSHF3+HaPE80F09JYrcyFePRKOwOylDAHgph06rQJpXppxYBF06v/ffhD/b/vd/0tlkGW+DsSJ5R8blHB+GtPQys6GCnNgc3sgZc+wMlQETjRk3hSr0xxZLiqq7OgEusm81Zrls1CqvfXwDKFqA6IAO6M2d48NQGpMwOOMQDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LD8/cmfR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LD8/cmfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760394705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DfiEGyujMC8JzCD4ccG1H7F2FakxMKQVO26onb7KWgs=;
	b=LD8/cmfRAwTl9Lq/VR80nCWFj1LTNJUAbEZj/aG+M6FV38CeS3uQ4DOLoFLGl6C1h9j/7F
	3A89TbI+NueY65/quWNfE152tFwROxzvfuz2jmW4rfiwVJntr+VL8KT3akJpo51+pavzpd
	KEpXz0rxV/mCgly6cyO2pAleSmyYpjo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-NX7JvKtpNPqQmxaMywJDqA-1; Mon, 13 Oct 2025 18:31:44 -0400
X-MC-Unique: NX7JvKtpNPqQmxaMywJDqA-1
X-Mimecast-MFC-AGG-ID: NX7JvKtpNPqQmxaMywJDqA_1760394703
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e31191379so33858695e9.3
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 15:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760394702; x=1760999502;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfiEGyujMC8JzCD4ccG1H7F2FakxMKQVO26onb7KWgs=;
        b=ATwRl+I1x6GJve1Kz3+2Nhu9LjNHPL5iIJYrah39DQQIBbWP7PDO/ILBH/+ESDXDmy
         nsf0O47XRLLy2Eanoa2HCxVgRfCrZm2XC29CCrFntDpd8LGB44j/TTjoE4vPt1213G6p
         rt5ZIkV8KHoJnyFwb7b7UXmnY3myrLO9xa1WnI9zZp/wVVjEwe40glMrtJdyBWRVw42E
         yROm6xLctkGF4FzllAM9Zu7xF/4O9IE2moHIjeYEUpApYQPmqPdcognQ/axwIxVNFoxk
         KSJ0HZcPB0+UjJ6j71pNMWwxp77lePYQvmYNfOUpxN5WxDsakoNU0sIWemyL41p7rMGH
         jftw==
X-Forwarded-Encrypted: i=1; AJvYcCUckt/3GHR7LvyGgTEAPv0Wr/QJQcTeGNl5NuodQlwK0Zlu6H4AwOBLYpUHu6ezF5OYfXn1iQ==@linux.kernel.org
X-Gm-Message-State: AOJu0Yz+kxvjmwCBW2LN8zq72xOfoQEmyvH7VyUeG2ZV8ii+RTRX5gGJ
	q2awD2+HaICgZx8WSfAilZWAEk47XVzqm28L2iaYh6XXvKbh81ZmI9L8G5XmiEhccIjPuX7pLyG
	vxJFqMSES1Er5sTxHiUGggS00qbLgFJNjyrWsKqCMKv0WBw+F8AH7yM00jCpUu7wbIQ==
X-Gm-Gg: ASbGncuiyzabWerVXsTbVUPlTS0/Uwq4Q2AzQi8KcVDGT4A7BfOjT6wVdqLUxo0IKRb
	I4b9sJaUw7+ZPCsAM4PnvBGrnDYnB2MPsc23Easzcwp8MNUU3GkFyJnMfdt2Ex32ihO0U5dJakD
	F7jxr1fDNaJ40hN8zpxrJERdvLb3UzoyBOP9EWJbsZkLrI4GewxDIPRQfAiHp6UySnB433c2CQx
	j8LXww6X2duI5FGhNxmMm7cor1iBfc3TD5AQZFXZiYE6R+ColNiY5UhZgWs+ZDcHLMzIxKa8koq
	TQ5pxaM1dKgOQlqXmqT02svFLvKw98pv848jBms9Y0Ex8kbCMSZsCKqgurptFVBOj2jbi35w3MA
	+pO39lBi0g0RsbEcNfbtdFxqr8V3Qj7bzgqfLwUWx8ig=
X-Received: by 2002:a05:600c:4688:b0:45c:b540:763d with SMTP id 5b1f17b1804b1-46fa9b18258mr168191795e9.33.1760394701848;
        Mon, 13 Oct 2025 15:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrWAx2AHWGky9KOT+sOcT6ftw0Aomf/Jhzckh0dZAKFsMu5HzaTtYZExBRgJvPAjzVKiienQ==
X-Received: by 2002:a05:600c:4688:b0:45c:b540:763d with SMTP id 5b1f17b1804b1-46fa9b18258mr168191675e9.33.1760394701456;
        Mon, 13 Oct 2025 15:31:41 -0700 (PDT)
Received: from [192.168.10.81] ([151.61.22.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb497b8fcsm206677125e9.2.2025.10.13.15.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:31:40 -0700 (PDT)
Message-ID: <2d4cd1ed-106b-414b-91d2-ba8e8730d2ac@redhat.com>
Date: Tue, 14 Oct 2025 00:31:37 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
 <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6u5mzQf8v3WgMSIWMi5ZjxT1jxcP_BGR1IkLKdDb2aw_1760394703
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Il lun 13 ott 2025, 20:53 Linus Torvalds <torvalds@linuxfoundation.org>
ha scritto:
>> it's there *so that no one has to think about it later*. Other 
>> information may be sufficient but the point is that you don't
>> have to "find" anything. Even with "b4 dig" there are *many*
>> extra steps compared to a click.
> 
> So the main argument is literally the "click" vs "command line"? 
> Because this argument is clearly garbage:
> 
>> and to reference or review them after the fact, and the message
>> id is *guaranteed correct*.
> 
> No. The message id is one random message among potentially multiple 
> versions.

It's literally the one that was applied, which makes it the right
starting point for interacting with the authors (the easy/common case of
reporting a bug) and *also* a good one for analyzing the history. This
is something that multiple people have said they are missing, right in
this thread or elsewhere.

I agree that there could be >1 message for that *patch* and that
precious information could be hidden in earlier version. But you're
focusing on the hard case. For many people (especially bug reporters)
all that matters is to have an easy point of contact between the git
world and the mailing list world. And for people sitting between you and
bug reporters, that's the case that we want to set up.

> There is no "guaranteed correct" about it. It may be *unique*, but 
> if there are multiple copies of that same patch floating about,
> that does not make one of them more "correct", and not seeing that
> there were other versions might well be just hiding other relevant 
> information.
> 
> So your "guaranteed correct" link is really just "guaranteed 
> unique". And not in a particularly good way.

I'm not clear on what makes it not a good way? For me it's an effective
entry point for the easy case. For the hard case there's "b4 dig", or
Patchew that I put together a few years ago[1].

>> On top of this, the message id indirectly serves as an annotation 
>> for series boundaries, since everybody is using "git send-email" 
>> which has a constant format.
> 
> Ok, that's just strange. That's not how any of this should work. 
> [...] Arguing for parsing the message ID as some kind of series 
> thing is just sick.

Can't deny that but it gets the job done. I am sure I am not the only
one to do that. When working on/with backports (either kernel.org stable
trees or distro stuff), a quick check of the message ids works
ridiculously well to catch screwups, or to remind me to tell reviewers
why I left out a patch. It brings 99% of the accuracy with 1% of the
effort, which makes me forget it's sick.

The point is that it's versatile and people have multiple uses for it...
One person's trash is another person's treasure.

> But I assume you use some terminal or IDE that auto-converts text
> to links for you?

Yep, it's a terminal emulator (Tilix) that can make any regular
expression match clickable, and will run a command to "open" it[2]. That
may explain why I like Message-Id trailers. :) But at least clickable
URLs should be pretty universal?

Paolo

[1] https://patchew.org/linux/cover.1760368250.git.leon@kernel.org/
[2] https://gnunn1.github.io/tilix-web/manual/customlinks/

