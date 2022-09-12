Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5627C2914
	for <tools@linux.kernel.org>; Mon, 12 Sep 2022 13:06:59 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id z18so6049647qts.7
        for <tools@linux.kernel.org>; Mon, 12 Sep 2022 06:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=EINGtd95r5h4zECWkrCowFWRhhIkX9TOZwetafF6rd8=;
        b=SjYnwwDJS9RvFBpefIBUVQ/OxW7QOzsfG/4qlRniBOdjDQJdheh4emCQuIM8fO7vOu
         s6BpiKCUwlltjVQhXONuPqywjZADJUo8rBaFvjN8ry55ktYz6qq90hNfieIm5QviJbu8
         8T9dC3QPbV2gk7rYpt5gH5f8LhE5hc5tY76BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=EINGtd95r5h4zECWkrCowFWRhhIkX9TOZwetafF6rd8=;
        b=WQ71JuIXdnU+1lymZ49pI37BiCvYUf6Kkd9zdthsuzE+OPakdtf/49J7/clJEjhRuC
         Ww3u0djP+N8mGx8kFfWm6iQIF4nbqZSFYwJgCFb3IrHAEbbdeQ33c6vqhG2ekAufQifd
         izJ5tBqPRg2mzTWQEUvZJNuGC3ObvU90y816PoxmfjmT4gkiqr9Opcvpdpp/0e3iRIMK
         z2fkDRz/wVU1osA3RH1/1Ijp5+V7G60RsshJPG7kI3KWDZhubhKJVsBe3fqhpJG+NJ3r
         PLVSNZfOUIdxE/Z/c7pVr56PVnYbn0EzopTHvNf1XI/q61gODE00egqoDO4BKXbTRTZU
         eMYA==
X-Gm-Message-State: ACgBeo0LZ4ncEIs/OoSxgyb4KfNIcELn3TtTScIbqtqInNjmBmglN2HY
	iJkNsb7tEGfMDLei/9b9wLYwn10OS1+tNQ==
X-Google-Smtp-Source: AA6agR6pSAQZrVvB1rWQh80o1U2HKHgGvp7o2whPNIMcryKK+aNFOLbk/h+LkYNdLjQmplNR/unTqQ==
X-Received: by 2002:ac8:5787:0:b0:35b:4179:240e with SMTP id v7-20020ac85787000000b0035b4179240emr13850423qta.597.1662988018188;
        Mon, 12 Sep 2022 06:06:58 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id h21-20020a05620a401500b006b8f4ade2c9sm7801684qko.19.2022.09.12.06.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 06:06:57 -0700 (PDT)
Date: Mon, 12 Sep 2022 09:06:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Florian Weimer <fw@deneb.enyo.de>
Cc: Mark Brown <broonie@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: Resolver splat from b4 am
Message-ID: <20220912130656.e4f3v7ssmfolxttn@meerkat.local>
References: <Yx8kXFRXB0chuYkL@sirena.org.uk>
 <87illspykd.fsf@mid.deneb.enyo.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87illspykd.fsf@mid.deneb.enyo.de>

On Mon, Sep 12, 2022 at 02:27:46PM +0200, Florian Weimer wrote:
> * Mark Brown:
> 
> >     raise NoNameservers(request=self.request, errors=self.errors)
> > dns.resolver.NoNameservers: All nameservers failed to answer the query 20210112._domainkey.quanta-corp-partner-google-com.20210112.gappssmtp.com. IN TXT: Server 172.16.32.1 UDP port 53 answered ; Server 172.16.32.1 TCP port 53 answered [Errno 111] Connection refused
> 
> This looks like missing TCP DNS service on your network.  The DNS
> response is larger than 512 bytes, so it can't be transmitted over UDP.

Still, shouldn't crash on that. I'll add the exception that's needed.

-K
