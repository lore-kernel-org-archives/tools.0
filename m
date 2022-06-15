Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ABC7A
	for <tools@linux.kernel.org>; Wed, 15 Jun 2022 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655283523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lljqzq4xb5o0ma2Wvg0Qq4Wuash5umEZjWHUwoBvwDM=;
	b=adi5MBdg8WuKCKO8tOZfgJS7CXXmVNqZVxYrGMgdhVUJcK1vfztejrATg3qcc/ML7Lnafu
	OidOv2etAL+FS8lUJdPmNacJ0jLgjS8J8ILGJ1nHLht4gaDidbwmwbnW4QCeaLNbdEXUMz
	6bzmn+yBTWPSztsT8o6LxVADNq7yFXY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-apb3yMItPBeFTHbixEY4xA-1; Wed, 15 Jun 2022 04:58:42 -0400
X-MC-Unique: apb3yMItPBeFTHbixEY4xA-1
Received: by mail-wr1-f71.google.com with SMTP id d5-20020adfa345000000b0021a2b352d06so144947wrb.13
        for <tools@linux.kernel.org>; Wed, 15 Jun 2022 01:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lljqzq4xb5o0ma2Wvg0Qq4Wuash5umEZjWHUwoBvwDM=;
        b=GoTKpSpivX52Zo2unKbb0HWuYBMrixA4ygHXBVRTquPQQQ34mPy2mcuUo7SAU1Ieyf
         sbNPOMzDyB7vUKD66F4BGqkVG/VT7S9YFoC0UUClfxR53aIaMPgTdB2xMiGOgiO0zXh6
         mtlCWPI4s4gsmev84h+bB7QWZgucVd1sCJp9eYMCWBM7kQeR37G82Is9g7lec/PFZCrx
         lUAB1roonU9HHCF5ew/NQFAXrYJ1RwP4AqPdsiSbiooZiDvPVBArsUkACWe2NAhZ3i2c
         xl5Nama3RAZdk2XRgwZ2ps727WsYSfMExym7T7qNLKCElJ25gDbM4seVuxgifP0WYQy/
         Tr0w==
X-Gm-Message-State: AOAM531mZexMS1sAqBcOiZpGnkLiDyZBQLwHKj1VP9d1xzRPqP03uOvi
	3IdCjgqkiEYQL1fIqic7/V8zXVs7D254cJZ/Lg9M5IUfzvWQWAlCTeKt6QpMpH+MBj4C4370UOk
	b9ZgWFzcdDEOME5QV
X-Received: by 2002:a05:600c:acb:b0:397:bdb:ffea with SMTP id c11-20020a05600c0acb00b003970bdbffeamr8842437wmr.56.1655283521155;
        Wed, 15 Jun 2022 01:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyAWslkKgtkNrNyBcaa8f6XVZyUeSKzXI9HH53/qxhpD11ZB+Bo4YS68G7fTuIUioEvp87eg==
X-Received: by 2002:a05:600c:acb:b0:397:bdb:ffea with SMTP id c11-20020a05600c0acb00b003970bdbffeamr8842415wmr.56.1655283520937;
        Wed, 15 Jun 2022 01:58:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id bd13-20020a05600c1f0d00b003973a3fe4fasm1697869wmb.42.2022.06.15.01.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 01:58:39 -0700 (PDT)
Message-ID: <bfae56be-bab3-05a7-633c-c6387e61392c@redhat.com>
Date: Wed, 15 Jun 2022 10:58:36 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: b4 Link: trailer disambiguation poll
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org
References: <20220614213955.eyex4bekp44iroud@meerkat.local>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220614213955.eyex4bekp44iroud@meerkat.local>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/22 23:39, Konstantin Ryabitsev wrote:
> 
> https://lore.kernel.org/CAHk-=wj9zKJGA_6SJOMPiQEoYke6cKX-FV3X_5zNXOcFJX1kOQ@mail.gmail.com
> 
> One of the suggested solutions is to use "PatchLink: " which is similar to
> "BugLink" already used for linking to bug reports.
> 
> However, other options were also suggested, and I want to survey everyone's
> general preference.
> 
> So, please vote on this poll to help decide what the trailer for linking to
> patch series should be:
> 
> https://docs.google.com/forms/d/e/1FAIpQLSf8fiT3Q_9LhqEvE2K8n22HZ0B2t7kpEK_XapoGK_kE0SOb4A/viewform?usp=sf_link
> 
> The winning option will go into b4 v0.9.

Why not just add "Message-id: <...>" like "git am -m" does?  It is an 
easy step from there to a lore URL.

Paolo

