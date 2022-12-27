Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F482F2D
	for <tools@linux.kernel.org>; Tue, 27 Dec 2022 15:50:25 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id a16so10659692qtw.10
        for <tools@linux.kernel.org>; Tue, 27 Dec 2022 07:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bu2HjjsyCzli92MXFQcQFEu4fzMZ0r41xGVWxJ3Fi4E=;
        b=c9CQgyLtZWfVHQi/WrIIIdGRM9RSl0dWfPhAWauDxfCLajvyYcPn0NS3mJxHIl9L24
         ipKCrNemJbIljLB7ggzEQ18GvqCF+T9qOERivCEG1qUQs2pQeFvpq/YHY9O5z+xj6z+C
         +nZRaw4CmMPqzBdu3e3GgJXOsl1yOyRywF+Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu2HjjsyCzli92MXFQcQFEu4fzMZ0r41xGVWxJ3Fi4E=;
        b=UU20SDdSP2fFTYbUEr07hUeefaxMBb3W3ALGu+PwXgw3TM0ErWUfixdXwgiIp5XQ15
         x/3enXrKtdmXFpIItUnJUIWH/gahdP4iVAoipZb9DHEG2qQDPbpjHjLuuF1wMiMknrHK
         534h76i7g9kql0uohrP9lWvrdH94Jeo+gDTdMh2h4vtQoe0aWMysJFr3dLEvSYyRP3iR
         6vMugtKM0PzIaawin42cCdkrtWdxE17GiauKxBl/ZtDZ2FbZS2lafcaefHNTg3jnfWLl
         O9t4Bgob9paRiLQUMpKHBg0ZUFE1u6eMCvz8/47z+anol1ebQEHTI4p5ldED/5+BaEja
         D1kw==
X-Gm-Message-State: AFqh2kplFf+rY7KGd2lFIcdjZN5zAl+qCFZVIkxCo5mT8uEhJ5FSZIS7
	8YGUg2HiVYfZGCe4ozCHejZrL7+ErT+FlTI6
X-Google-Smtp-Source: AMrXdXsgGNr4R4zXPxFmttADgAz97F+FTpkOFdHLuplz2t6sQNsLPP95x4c412KP4egQOOJjAM4erA==
X-Received: by 2002:ac8:675a:0:b0:3a8:2e:ea22 with SMTP id n26-20020ac8675a000000b003a8002eea22mr28111494qtp.44.1672156224195;
        Tue, 27 Dec 2022 07:50:24 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id w26-20020a05620a095a00b006fc6529abaesm9469884qkw.101.2022.12.27.07.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 07:50:23 -0800 (PST)
Date: Tue, 27 Dec 2022 10:50:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bill Pemberton <wfp5p@worldbroken.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 and abbrevCommit
Message-ID: <20221227155022.jt2qacjr6wv5qsl2@nitro.local>
References: <01304af2-3412-8385-3336-4dda9104336e@worldbroken.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01304af2-3412-8385-3336-4dda9104336e@worldbroken.com>

On Fri, Dec 23, 2022 at 05:22:27PM -0500, Bill Pemberton wrote:
> I've discovered that b4 will not work correctly if you have abbrevCommit set
> in your .gitconfig file.  For example, a simple 'b4 prep --edit-cover' will
> result in the cover letter not actually changing. You'll get the edit
> process and such, but after the fact the commit with the cover letter will
> still be the default one that b4 creates.

This should now be fixed in master and stable-0.11.y.
Thank you for the report.

-K
