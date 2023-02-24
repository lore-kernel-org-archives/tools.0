Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2175CBD
	for <tools@linux.kernel.org>; Fri, 24 Feb 2023 14:57:16 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id ks17so13713882qvb.6
        for <tools@linux.kernel.org>; Fri, 24 Feb 2023 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS2HRVZ4/CsJe4URR8r2FSBgKCMknrP2qGtQe9252i0=;
        b=TXD2wcv/I5KHgZPgWus8lQhQmXAoqZnt0G+F7BhluT/XRwFF3ElrU+2jQp2FvFF7Tp
         iPh/qSEG9BqV9SSjHcknB38VXNM0VFZmxjQfKmukVNU6Ao5IOGWOcBuVrHSN60yCbv0h
         um5iCN+9RuCQ9vZPCvF4t6lgxtJmH1LbB0mvuidZ/bQgf/8uSbCWyegRBZwdcIS/TpOx
         6abVWMQn65xnSjG/19HJLYF6Z1CrPRryQKisaUonZMTttjwHN1ZZ2vegNR8WrSsF958N
         /w3tUklfl63XpRth2zKRh3lZ0IJYOXu7p4eIJC0zCm/maQVk8VBllJSRza1qcCbYYS2w
         pMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AS2HRVZ4/CsJe4URR8r2FSBgKCMknrP2qGtQe9252i0=;
        b=bxmX/iEemSZdesb7ro6UhH3YMAesnEdJdDP2UC04VV5Us9IKW2DFiT3k9rEXm1qKFs
         AJBIY7irkLys1lDBwtAKJDfFGzg+Xv/h3MApJi19si4k2eH+hrZZRcFrjnwzEE1wrT1R
         +OZ2p8RCQrgdqyQR80IfzIUlUJv3S75umggYQil5umcYVU3cFX3yYWj01JEIm4m2Jyz1
         zxHKM0J7qYBhxsQvzJZz4HJBIgfjsolkbtd5qr3An6YC0UwqitMUffVz9PRHdwngJGlD
         IaIFEwZwa4CxIEBYvX/YOnVjXuKwsRAZrpa2SxzD1ph+fKlHFhWWPohEHfBoczs8R4vZ
         h2yw==
X-Gm-Message-State: AO0yUKUd+dFgIsOtApyIh1kJWPZ3OS0lGu6IZKhJCyVMCoN065JBnrvR
	5BP56tUHURGzIOXnHjpKb6JOQYFBt7o=
X-Google-Smtp-Source: AK7set/Hqy0ytSBUoxpDjXk2BaR2M3O/iKt5uzXwSw7k4HbhTk0W+ruOkeQ+bXvKiI/fOOg+Vmk0dw==
X-Received: by 2002:a05:6214:1942:b0:56e:9210:e34c with SMTP id q2-20020a056214194200b0056e9210e34cmr34923168qvk.23.1677250635672;
        Fri, 24 Feb 2023 06:57:15 -0800 (PST)
Received: from [192.168.1.128] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id s128-20020a374586000000b007426b8eed51sm1868782qka.118.2023.02.24.06.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 06:57:15 -0800 (PST)
Subject: Re: [PATCH] ez: allow remote-tracking branches as 'base-branch'
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <4cfef9ff-2b96-943e-4017-bf8b0829d330@gmail.com>
Date: Fri, 24 Feb 2023 09:57:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit

Hi Konstantin

Le 2023-02-19 à 19:45, Philippe Blain a écrit :
> Since 83b185a (ez: support enrolling branches using tags, 2022-08-16),
> we use 'git show-ref --heads' to check if the argument given to
> '--enroll-base' is a branch, so that the alternate code path can be
> taken for tags. This means that since that commit, using a
> remote-tracking branch as argument to '--enroll-base' does not work
> well, because such branches are not shown by 'git show-ref --heads'. The
> code path for tags is taken instead, and this usually leads to a
> "Multiple branches contain object" error (since several local branches
> are often based on the same remote-tracking branch).
> 
> Pass a fully-qualified ref 'refs/heads/<enroll_base>' as pattern to 'git
> show-ref', and also pass it a second second pattern
> 'refs/remotes/<enroll_base>' to allow both local and remote-tracking
> branches.

I'll send a v2 of this to also allow '@{u}' as enroll-base, so you might want
to wait before applying it so that the whole series can be applied at the same time.

Cheers,

Philippe.
