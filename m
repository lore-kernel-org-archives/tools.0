Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5427F
	for <tools@linux.kernel.org>; Tue, 18 Oct 2022 14:49:11 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id s17so7573830qkj.12
        for <tools@linux.kernel.org>; Tue, 18 Oct 2022 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t302ZlMOwo799knLX2r/xPDDOZ3ACM6iqej5LB9rlQA=;
        b=Lb+QYObtvBjz1mjzeE77egMU/gQxU3v7prPX927eJNeA9j784Fvzbg14XDT0XrDkhL
         zvNe7Q9kWqR3qmvgEbtI3UomB2tW8x5V2qxlHyyDpoX0MY7fJxhTJuikH34RtOcfNKsL
         EKrJmWGs+hVsesLR/Z8JAVrYO1Ez4FC7mKpzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t302ZlMOwo799knLX2r/xPDDOZ3ACM6iqej5LB9rlQA=;
        b=nUYHhxvNvG82Uy9lgp7D8P2n+WzXl+6i8z1VE6z2mNrGI9QwSGPSe79JEEVeQCHmV/
         C/Lqtbh62ge4GwQGWSz6TwqJ9EQ15b+XxWtOf4Y3ZwQzMX2Ie5hTCnKtjq4O8bO21a3D
         82ZOyfafT1oVJB9olf9F5BZtLYR8Df3pT4lai2cWuElj1QvBqZro/4po/9kERYIDKOIg
         WLr5JWAQPKEP3jcvILIbUVPWXN42zWBGHD8tiIgy0ZrqXVJ4hcpTfl+QjQ1trsLYdc7k
         pqsQdpSdJ9iM68F6vTy9dikbtbcT5Efuv0zHPOoIvfr9tEuRnI6kiVhxbxjfOxjYQ4fi
         tUCA==
X-Gm-Message-State: ACrzQf3RtAhmmavryBkFRO6L9o1xwbDZ5JJjkEoPVU+aEP3OMPHmcFqP
	Mce82gG9b0E6lAdKvyoPVsEkutSopUDi0Q==
X-Google-Smtp-Source: AMsMyM5c2sV98w3DkmMUdJtZ4P8vvnIbBCpTr5EA/uXdyaQdaKoaHnqW8cznWxQnWYgvVT1KObXjeA==
X-Received: by 2002:a05:620a:4091:b0:6ee:db2c:55b7 with SMTP id f17-20020a05620a409100b006eedb2c55b7mr2098563qko.636.1666104549801;
        Tue, 18 Oct 2022 07:49:09 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id l20-20020a05620a28d400b006b8e8c657ccsm2551803qkp.117.2022.10.18.07.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 07:49:09 -0700 (PDT)
Date: Tue, 18 Oct 2022 10:49:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Nicolas Schier <n.schier@avm.de>
Subject: Re: [PATCH b4] mbox: Exit with error code if no messages were found
Message-ID: <166610446030.762369.5969444862438690223.b4-ty@linuxfoundation.org>
References: <20220825064109.550092-1-n.schier@avm.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825064109.550092-1-n.schier@avm.de>

On Thu, 25 Aug 2022 08:41:09 +0200, Nicolas Schier wrote:
> When mbox.main() is unable to retrieve any messages, some kind of error
> happend (e.g. msgid has not been found).  Forward error state to the
> parent process by exiting with exit code 1, to allow proper
> handling.
> 
> 

Applied, thanks!

[1/1] mbox: Exit with error code if no messages were found
      commit: 7f570514424cc46f02fb89399b05f50b41e7d038

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
