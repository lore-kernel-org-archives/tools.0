Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7DA5A66
	for <tools@linux.kernel.org>; Thu, 29 Sep 2022 22:06:39 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id u9so766778qvo.11
        for <tools@linux.kernel.org>; Thu, 29 Sep 2022 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=hJXUWzl3Vz3k7Tt+7wZ29IvNS010MMisxFwYrsMrNys=;
        b=L9iJYFEF7SHvsrAY6rOZPmg1RqlAQk+ZE/W2DYREGomGeTtzshrtbaTFuMRuL0/iGv
         /pyFsXTIRAs1QUuu49+RWvPJ/adbXze81ueYweH15FIQUuqNmkdgyWJEOmkYzlvSkDiH
         5LzY7fb2EXHQpI0EQ2BctLLzrEnoYHIwDnbI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=hJXUWzl3Vz3k7Tt+7wZ29IvNS010MMisxFwYrsMrNys=;
        b=e6viakfVLjTr9dZUGlbKZOLUpW2rwkAZRkYx3abT0SFpUHjcZ+nxltTvV4zqx6z3SV
         UTZ/hXzPiKvNTEp3YkT3hvXclvVqSkO3Enc/nWqD6qfPbrgat3XslJWBUiUpZYp1cPkT
         uZWxWLCl8Wui4q5gJsLTBeeAPMeuagAtuNoRFsqeCyS31jAEzm075fs768y71aZ7c1fY
         IwBXTFgTsRZmNw6aB69q4QTfSbBFsx/nP2UE2jirsBexHc90Z3xJ1XEXbVrZ813tRj9o
         N2ZQw719YsTp9upQ4P8rZmkmEP/ckEct9xf5sCYktKd9TsdS9jJTXQaPxHis+1qApZZA
         xHQQ==
X-Gm-Message-State: ACrzQf1hTcWNIKr7iH2ZkXij9Se+RS6VePVZOhwAyf8y6pYtDtzJeokm
	Hlre2gPl6cYW9yEjAI939nRpmg==
X-Google-Smtp-Source: AMsMyM7wfDb02NU1vPPkBLGzynubVAtZD/54/+IFLnHEA56QoHiaiujZQaXNwhSTO3jPwcGcTl94WA==
X-Received: by 2002:a05:6214:d8a:b0:4af:b727:94df with SMTP id e10-20020a0562140d8a00b004afb72794dfmr1073037qve.122.1664489198039;
        Thu, 29 Sep 2022 15:06:38 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id h10-20020a05620a284a00b006bb83c2be40sm707690qkp.59.2022.09.29.15.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 15:06:37 -0700 (PDT)
Date: Thu, 29 Sep 2022 18:06:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Preserving notes when updating trailers
Message-ID: <20220929220636.zqv5bsqnsxnjaicq@meerkat.local>
References: <20220929074717.u2xfvfwq4ki732tw@wittgenstein>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220929074717.u2xfvfwq4ki732tw@wittgenstein>

On Thu, Sep 29, 2022 at 09:47:17AM +0200, Christian Brauner wrote:
> When updating trailers using b4 for a series git notes aren't preserved
> for the individual commit messages. I have a work around for this. After
> updating the trailers I can use filter-repo/commit_map which provides a
> list of the old and new hashes. Then each line can simply be fed to git
> notes copy. It'd be nice if b4 would be able do this natively e.g., by
> having a command line option to preserve notes.

Yes, we should definitely preserve notes on such operations. Let me see what I
can do.

-K
