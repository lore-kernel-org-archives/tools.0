Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C59A2C
	for <tools@linux.kernel.org>; Mon, 18 Jul 2022 12:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658147932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XeWH9Fw48uZ0cAdeufDyARBGxTezHr0cywIHHck7vII=;
	b=Tl5bXZLow6TjnZumXo1L138Yo+ahpBvZmtDy2GdbXuIhkf9hzEEG7sLG7sXud86FfJsjOE
	Myzzyn23lOKsneTGbhwUzqQtwsJxvO2jYSpCVGDinQxg/wHCkhO3fjeK3vvTDCjM6zNGx5
	ekYu2lq9BeMkFnNpdBOyN7uqd+RFN1U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-z39xfKWaM3i93_WKvP1NMg-1; Mon, 18 Jul 2022 08:38:50 -0400
X-MC-Unique: z39xfKWaM3i93_WKvP1NMg-1
Received: by mail-ej1-f69.google.com with SMTP id hv22-20020a17090760d600b0072f2cce7d10so335807ejc.19
        for <tools@linux.kernel.org>; Mon, 18 Jul 2022 05:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XeWH9Fw48uZ0cAdeufDyARBGxTezHr0cywIHHck7vII=;
        b=NsI0Iw8FY/kH+QJE0Zfl5jZBjiLzmz/Aj86UoxJzOdHhQoQUIUDqdTclMLVZEU91ED
         j5kosBhTLIhBe47Pro0OxseST0aI/Im2b0cEkD7hMW4Y0Az5SVIlSVKdYCPjQyS0o2bv
         0srpkm5hDQkamOd/2F9hkO+lOaPjPL4debQF0eCv/hsBTLs5MjY5y/UhwUEBv4ZBsDAD
         spx3KVGQhFGV4xqdhhKsC/bFuEwKJB+LqYfmawEA/jEK2sW25eaDDKxVE1Pbkc/BL0rE
         qEcpAVcofbDn0Noa9yhHNAOakpvH4gSrUuNa3f7lWeWYkDeajLcJd2ziW/nEhF0AMCjx
         RGsg==
X-Gm-Message-State: AJIora8GKAGJGKjm7GLHy2VzbKIbCO1fw70kgiFtv7LisE2xO/Xpd5Ti
	pO0cfjlAQSpoq6szWhmMWrkVe9yeVa4Wuh5VBkWfu7igvgUBQtt3n1libsVo5ftnbX988MzWt0b
	6c202RWYEwX6FBHKR
X-Received: by 2002:a17:907:7b92:b0:72b:67fb:8985 with SMTP id ne18-20020a1709077b9200b0072b67fb8985mr24658517ejc.569.1658147929687;
        Mon, 18 Jul 2022 05:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v9GBV8N4BhbL6EGjvPkVlMmdTuvDGwCsd9bHY67RcghNw5x8+jVulJD6LoWg+91NTzp2kF/Q==
X-Received: by 2002:a17:907:7b92:b0:72b:67fb:8985 with SMTP id ne18-20020a1709077b9200b0072b67fb8985mr24658500ejc.569.1658147929466;
        Mon, 18 Jul 2022 05:38:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id s26-20020aa7cb1a000000b0043574d27ddasm8482517edt.16.2022.07.18.05.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 05:38:48 -0700 (PDT)
Message-ID: <bd6f5628-1afe-efc9-9c2a-44685d730bfb@redhat.com>
Date: Mon, 18 Jul 2022 14:38:48 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: b4 submit ready for beta testing
To: Maxime Ripard <maxime@cerno.tech>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220718084927.nlomzhq3ipni5alf@houat>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220718084927.nlomzhq3ipni5alf@houat>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/22 10:49, Maxime Ripard wrote:
>>
>> One thing to keep in mind here is that actual trailer matching is done by
>> comparing the patch-id (see git-patch-id for details). This has the following
>> important bonuses and caveats:
>>
>>    - You can rearrange patches or modify summaries without it affecting the
>>      match.
>>    - If you modify actual code (even as much as fixing a typo in a string), any
>>      received trailers will no longer match. This is as designed, because if
>>      you change the code, it's no longer reviewed (but we won't remove any
>>      existing trailers that were already applied).
>>    - when you use --signoff, this will move your own "Signed-off-by" trailer
>>      below any other trailers in all series commits, which is commonly
>>      recommended for the chain-of-custody purposes.
> Ok, that part is really awesome:)

Yeah, and it's the part that I'd like to have as a standalone tool in 
b4.  Can we have some kind of "b4 update-trailers <MSGID>" subcommand?

Paolo

