Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F147979C9
	for <tools@linux.kernel.org>; Tue, 13 Dec 2022 20:19:21 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id d185so15893525vsd.0
        for <tools@linux.kernel.org>; Tue, 13 Dec 2022 12:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P6lZXcLm6NgULD6QMGKNiVFFCG1ecMjfAE+0zhpk5aU=;
        b=LnXm6EJ1VT3frcZYhercPF8KEM88lmZ14KjFNjeeGQklG6WkqtNsgt6AwqSZxw/DvC
         eM+B+A1a5hwXYAEJ4rbSiwWQm5i2cRDctYOi7wjXFmjwnsVUS3WXSciPK+RQusYoikHg
         10zsA0iiPhk5b1UA6mbxL54w60JwIs1aULKWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6lZXcLm6NgULD6QMGKNiVFFCG1ecMjfAE+0zhpk5aU=;
        b=Cu7jRPqaUpfm1nm51v/c0PnfkkRNWiHMDdxVm5wcOrSsPmB0j9V/fcsJzy4tatJZ7K
         vJgZEIkr0DrqtDMLa4gMm1byxF9UjLb4XXKKr9oO0KkVTlDszOd9M20eG9Yu23J5IfNT
         IjT254EH1y4R9N5dif8o90jJQ29ULwYzfM5HhX87wknSehY8jhfnHWjIF6BcAvwEEkA6
         zxclJ14ZMhckw7k/1128f0Pl9GfWpMhikgXPa8reTUd/ugbbLfUqSbaBAlP4fIaV0j7E
         5zi6RkO8nWShSxSXwOPQzNS7zbKsWbVUGljuDE0oXdu3gUiDVzGcwxWYvvC0AgzZHfaC
         F5Pw==
X-Gm-Message-State: ANoB5pkeIB3/t6lvPF5mWdclQKx+U6fnw7D56ykD+ibUC7fMOaaLSU8m
	WfCcTmBFj1DfeYJlX0Xwnjm85AYdrpGv02FI
X-Google-Smtp-Source: AA0mqf7c53n5K6HalypWzM+H6HGtjwpFa1AfJgPjP3EJDW2IX/VYZBxY/vtjlG5Plb40/Gj8bZn8Yw==
X-Received: by 2002:a67:ef98:0:b0:3b3:f14:f61d with SMTP id r24-20020a67ef98000000b003b30f14f61dmr12579899vsp.27.1670962760665;
        Tue, 13 Dec 2022 12:19:20 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id f1-20020a05620a280100b006ff8ac9acfdsm6515395qkp.49.2022.12.13.12.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 12:19:20 -0800 (PST)
Date: Tue, 13 Dec 2022 15:19:18 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: tools@linux.kernel.org
Subject: Re: Requirement of using smtpPass
Message-ID: <20221213201918.ahs76vzctmj463fk@meerkat.local>
References: <COXAHN6YWLQH.33YW8LAHHXH21@otso>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <COXAHN6YWLQH.33YW8LAHHXH21@otso>

On Fri, Dec 09, 2022 at 01:35:21PM +0100, Luca Weiss wrote:
> Hi,
> 
> I'm enjoying using b4 so far.
> I've noticed that in both my current git-send-email setups (work &
> personal address) I don't set smtpPass in my git config.
> 
> For example for gmail this is the config:
> 
> [sendemail]
> 	smtpserver = smtp.gmail.com
> 	smtpuser = luca.weiss@fairphone.com
> 	smtpencryption = tls
> 	smtpserverport = 587
> 	confirm = always

It really boils down to git-send-email being super complex, and me avoiding to
do anything approaching feature parity. :)

> Regular git-send-email just prompts for the password when needed, or
> alternatively I supply it in the invocation with
> --smtp-pass=$(get-my-email-password) to avoid putting my email password
> plaintext into the config.
> 
> However b4 just skips authenticating completely leading to more or less
> obscure error messages from the smtp server (b4 only tries to
> authenticate if it has both user *and* password set).
> 
> Would be great if I could specify in my config a command that will be
> run that just prints the password on stdout (e.g. keepassxc-cli with
> some parameters) and b4 uses this password then, this is then similar
> functionality to the --smtp-pass=$(foo) I wrote above.

For now, I implemented invoking git-credential when smtppass is not provided.
This isn't quite what you wanted, but gets us part of the way there.

The feature is in the latest master.

-K
