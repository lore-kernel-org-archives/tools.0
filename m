Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2063729A8
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 20:03:43 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id k20so5470375qtj.5
        for <tools@linux.kernel.org>; Wed, 22 Feb 2023 12:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=doJ7WiDXR4IG4bGelWP2Wi3nI13BjnYEqkjSM5dO4O8=;
        b=goTDaDVjyvrSOfXu+ThBFYKXUIRORWksGCcKvXlNPTpgj3Qo9uicwTcUjEaaORLfgV
         ieQ9u9CSlWtZNzpi3+QSMBYBE91HCnTEdiUvax0cfHaludU10kFM/WK43bc0DngW14wg
         ks/uREcCSV8lw6Q5rGzdEF4IQBNZDL0FKfTXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doJ7WiDXR4IG4bGelWP2Wi3nI13BjnYEqkjSM5dO4O8=;
        b=ruvku0GHNOUIY496LDmr9PJ1GHJ2Tro/4M8u2gdXBndSzp5h2wyxBgXdNS/hA3HENB
         lIS7Hie3REW9FmY243c9F0XSoPwRNdFc6m+yP8saCXYcYPeG1YEp1/OMCbUNDRLRf5mt
         iWvOSghakTAf3oHEreG1qEzTTxnfpz+9Jtk7mvOWWoIPjxQtcPPrrfxSTNEHD8XOxWQq
         7j4rGBiA4k5qgxHEvpEaknx0LA8ITbzgFXZU8e3C9UMmlyr6cY01/IIfaf2f9PtyXnoy
         +9NaIhWSxMVC11geGJUTelNlVWqW7ZtdqYFLeca1hMTdExS253ZVhq/dGP/zvj3lqG7i
         O6Lw==
X-Gm-Message-State: AO0yUKUn27K4wYrQbU7PqN4VsbnagjvKdSWJg0+Wn1KnerRY6d3yWyRI
	zqqaJCUHm4HDwQadC68luwtGjw==
X-Google-Smtp-Source: AK7set8TO4UxpWtQyLCjR74NgFB5oRMXk2zyCyiYQCQ9ZSSIFSuECW4D45GYUsP6LVUaZ67OjyRaJw==
X-Received: by 2002:a05:622a:1106:b0:3b9:e4cf:ce2d with SMTP id e6-20020a05622a110600b003b9e4cfce2dmr16412855qty.16.1677096222802;
        Wed, 22 Feb 2023 12:03:42 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id ay27-20020a05622a229b00b003bfa2c512e6sm3477226qtb.20.2023.02.22.12.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 12:03:40 -0800 (PST)
Date: Wed, 22 Feb 2023 15:03:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nathan Lynch <nathanl@linux.ibm.com>
Cc: tools@linux.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: b4 submission endpoint sender name length
Message-ID: <20230222200338.sinridhdzgq2k2dd@meerkat.local>
References: <877cwk9uor.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877cwk9uor.fsf@linux.ibm.com>

On Tue, Feb 14, 2023 at 08:40:36AM -0600, Nathan Lynch wrote:
> Hello!
> 
> I've used b4 v0.12/v0.12.1 to submit kernel work to linuxppc-dev over
> the last couple weeks and it's working very well for me. I have been
> using the web submission endpoint.

Nice!

> When I checked with the powerpc maintainer (cc'd) to see if my new
> workflow was causing any issues for him, the only less-than-positive
> feedback I got was that the sender name set by the endpoint:
> 
>   Nathan Lynch via B4 Submission Endpoint
> 
> feels a bit long and sticks out in the patchwork UI. Could this be
> shortened? Perhaps "via B4 web" or similar?

Thank you for the feedback, I've shortened it to "B4 Relay". It won't help in
your case, since the patchwork name is set at user record creation time and is
then never changed even if the From: changes, but it will help others.

-K
