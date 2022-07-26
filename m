Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478492579
	for <tools@linux.kernel.org>; Tue, 26 Jul 2022 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658843731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bMNevkPRVsmSz/BO2eC/tfT5iRc/lw+2ZAYK/3JDFNc=;
	b=NHJXw0BsY9OZtkwo2CsVJbQZOJAXwST5/p9ZFULd0o63YODLyqIIMNz5Nd/9ID4QmMk+6X
	N9u5PuJe15Tl3Jpi12B6nDEjQg9u0Sd1PwvrZq0ujPXCK3Rd6x4CIgUrj7lLGttMwwfCi8
	gPwiAUDvYjDkwA92Ydbm7I8dopwZj0Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-5slXjPyRMxa5LJ6nn7trQA-1; Tue, 26 Jul 2022 09:55:30 -0400
X-MC-Unique: 5slXjPyRMxa5LJ6nn7trQA-1
Received: by mail-ej1-f71.google.com with SMTP id hq20-20020a1709073f1400b0072b9824f0a2so4408205ejc.23
        for <tools@linux.kernel.org>; Tue, 26 Jul 2022 06:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bMNevkPRVsmSz/BO2eC/tfT5iRc/lw+2ZAYK/3JDFNc=;
        b=4YzRs0lkri/SpDwBArTgJyw2ak/SnhztdBnj8AaHf2KeC1w07eUxqH3pq+M2jOesVi
         EbcCC4FIqncBLwSpe1mGygaU3YvUhTwkCRUSpmKdxZp3GNSyfg4HyZe09okAzhFtQ7AE
         3/eh/a+eC/0ZB2n/fYCltdFnNpQOPlKuDivxze+HfekQpjDkb+vmq3nrWRZYRub29BhE
         Hia9AxqJHMzHO4KtnwPXCRhL4zkqJQRGHHV1++XQT2/bx8KxGhrXFTJQ+U4HAXylaNmw
         bN5Fk9XIW2PY7rskqGJZTaMvv6B2sdZ2ZK5YwJ8lWZ6MLQMGjXd5AhxIVljBCS6Av9kN
         MXTQ==
X-Gm-Message-State: AJIora9Gs9a7YJM+aGgqruzedTplzEoPCTuAhwa3baPazvkkzpxe+1+Q
	E3xD18NW3WXlJxf77Ejn8Pw5y1UFx9Bh90wZg068r2hUXDPaG8li5sMa+GaAFGjMgBGi6yoroXI
	wT/D+BKRKy997c0j0
X-Received: by 2002:a17:906:8a71:b0:72b:11d6:29fc with SMTP id hy17-20020a1709068a7100b0072b11d629fcmr13671943ejc.494.1658843728923;
        Tue, 26 Jul 2022 06:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u5rmC8NYGXIlAF9QLXYPzC9Ka4PZaeNlhMSU0H4oUTf2S1Fi0dzVHZkaZbDYxbh9Z4Unc25A==
X-Received: by 2002:a17:906:8a71:b0:72b:11d6:29fc with SMTP id hy17-20020a1709068a7100b0072b11d629fcmr13671922ejc.494.1658843728545;
        Tue, 26 Jul 2022 06:55:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id fu3-20020a170907b00300b0072f47838640sm6480745ejc.71.2022.07.26.06.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:55:27 -0700 (PDT)
Message-ID: <02bd5767-6458-9015-484e-2c7156aa93a9@redhat.com>
Date: Tue, 26 Jul 2022 15:55:25 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: b4 submit ready for beta testing
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local> <87pmhs1d8h.fsf@baylibre.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87pmhs1d8h.fsf@baylibre.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/22 10:37, Mattijs Korpershoek wrote:
> The "ez-" part has, in my opinion, no added value for users. It
> assumes that using these commands is so easy that "you can't use it,
> you're really incompetent". I think we should use more "neutral" langage
> for commands (without judging if it's easy or difficult).

I agree, and in fact I'm wondering if the series/send part really 
belongs in b4 (as opposed to a separate git-publish-like tool).  b4 
right now is a lore-specific tool, while series and send apply generally 
to mail-based patch processing.

Paolo

