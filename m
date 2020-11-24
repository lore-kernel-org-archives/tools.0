Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.53330.1606229750346595611
 for <tools@linux.kernel.org>;
 Tue, 24 Nov 2020 06:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qlsqo2Nr;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id k3so3861562qvz.4
        for <tools@linux.kernel.org>; Tue, 24 Nov 2020 06:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jYIEvuxsGXq+LfAT6jXS87ymhqHQlxes8eogt+o9ozM=;
        b=qlsqo2NrLYBGsQ78faS+yOCWrLr+QJ6Mp4KKig/yXQLzdoqp5mw5nZZmew4nZoaSn3
         U2sha0bjIYfCehHbWzXx6cFxGEBD2T408bZ0HLohVi6EMLV4edtZAm7JnWlD22KZ3Yy7
         NBlaGGb4WejapbYPpVT3FTDc0C72bW+2XGjYJU/MKMN2jZbHw3pQeRMUfkeeSTqIIrOU
         wbsaefr0IxewZ54hv+DYk/RjHyyhbMCw9oniFPAiEOml+SqSBKtHPczF5dT7anv4DrKL
         1ISdS/uyLbVXBi5AI91o/au8Gr9nlQbk45UJ3i/5sa7rDYuyMXfKY5FKlUV7Ffpqjvfs
         z2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jYIEvuxsGXq+LfAT6jXS87ymhqHQlxes8eogt+o9ozM=;
        b=XenKOkNRNcjQxuhfBqO3ez/vJg7yHPJb4s5SWcHHvnRpDMinTjJcWUYs1ncm1iCm/2
         vG6PXL0awIJAq7lSvwXeL7MG595qu1+gVzLj8mN2nvL7GGpeLZnm9Ec40adKUjGepmxy
         85ICQ95I1yX13ACr32UFfoL8sLh7lzPZRXA/f8nqDPBNqr4zPm78AxXO8A+8ci5Ywv7A
         9fTNurzR8WGKEYs3Xqkeciy8CzftfxJRDSO/cXO3gwwl3DTRR0Dd8rif7Hx5HsaQtfOk
         VyE7SFsYjNDgZFNeK1k1Mlwh3MmEcXp788l4mPG69zWXykxtIKP6YCk1572VQNUu5j8F
         gabg==
X-Gm-Message-State: AOAM531EVdh6C2AU7ja/XWAKkYQwWUiZmu+QeTqzj/IELQGnwKU8FZ3n
	OsF04DHDDQwjwDPNBpHAjiy/7/b80TrYsA==
X-Google-Smtp-Source: ABdhPJzGV428NXowHlpOovQOm25FWuKGlqB2jClL8dtlRWOje2a72VJJi/SeYu5Rta8cka4Wpv1KkA==
X-Received: by 2002:ad4:4908:: with SMTP id bh8mr5195414qvb.58.1606229749229;
        Tue, 24 Nov 2020 06:55:49 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from [192.168.1.127] ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id v9sm13073655qkv.34.2020.11.24.06.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 06:55:48 -0800 (PST)
Subject: Re: [BUG] b4 can't grap thread with already-percent-encoded slash
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@linux.kernel.org
References: <2ce40a78-4291-c01c-f468-8b7f3be2f379@gmail.com>
 <20201124144542.arws25irjgylbrqa@chatter.i7.local>
 <8a1500fe-7c1a-2904-7723-8e638f524c03@gmail.com>
 <20201124145232.2mnfvyqy5cdb7ds7@chatter.i7.local>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <2dc4badd-6f08-d83b-f57d-48c1286748d0@gmail.com>
Date: Tue, 24 Nov 2020 09:55:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124145232.2mnfvyqy5cdb7ds7@chatter.i7.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 20-11-24 09 h 52, Konstantin Ryabitsev wrote:
> On Tue, Nov 24, 2020 at 09:49:41AM -0500, Philippe Blain wrote:
>>> Yes, I kept meaning to fix that -- thanks for the reminder. The 
>>> latest master/stable-0.5.y have a fix for that.
>>
>> Not sure if you mean that it should be fixed in master... I installed b4 using
>>
>> pip3 install --user --upgrade git+https://git.kernel.org/pub/scm/utils/b4/b4.git#egg=b4
>>
>> so I'm at version 0.6.0-dev. Is it supposed to work ?
> 
> No, I *just* fixed it, so you'll need the latest master.

Ha! wow I'm impressed by your responsiveness then :P 
Indeed it works - I jus re-ran my pip command above to upgrade.

Thanks a lot!

Philippe.
