Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61772F29;
	Thu, 22 Sep 2022 21:59:16 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id w20so10043170ply.12;
        Thu, 22 Sep 2022 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=pz/IlWraXtzMp2yCHs3l2lXQ0XuBYbfng27pJB7kr2o=;
        b=B+PPLxPeF37fCvPDdZO/7OuEe6/czly/yFJMTM2qGosvzPS7/45Reyg/xFxzrqxO/1
         dGhgk58vJa41pebinm2+7h0xKr6UnJQicLo94NT17tPQHE6KqEQCtyigLUQuRJfMq9g2
         IxQGEGBuhEt/JPpOO7nl2pvS9v0rTnWiKdHMKPmw3Z8y5qYzxpF64GNaisD7N+yEvBFC
         AfrikZ0AmMACqWZNKDBOr5Qpw6rh5hZoUd36r3PCsiawPPgoMe0Tk4hFb12VDvoOT1er
         czpRd6mA4yocqaUcjKiGCGcuK1U+zpF89TF86lZUsNWNRz93wPIy7YJPUBNT7SNZmu/5
         4nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pz/IlWraXtzMp2yCHs3l2lXQ0XuBYbfng27pJB7kr2o=;
        b=yuOPSp9Z1FE6s/RXLf09+eqD1xVhNlrKlE7fxUusHfrCxLcvtGJi4qKaCsoA47F2Gf
         xJz2o2XcIRw8DZFQi+4OA+Na2hsRhrXhIB10shSspsxM/a9h7PFVkKQ2hH/bQE6FWXBf
         f/+mjl92ptJ9/PAXi2KeAA4VbBBUckE3yC6RVR+Fo8m+sx8oIOZ92Q6fxTL5UBKLTbus
         dzWXpq1/C0nQXofEpvBIceRrXUO/ixcnaD4m75ZFVV2RQSeAiVFJjQwFnQQVC45PKbLV
         BLvaFkf/WH9tMjkB2ky6Iy9BeTM3/qjCdZhygMkDvYshangs4X7QenIuRFuRUg8N2XLY
         GaIQ==
X-Gm-Message-State: ACrzQf24EWFd4Ec8hYEKd/DHVmwLobi5PqIfanWOvy8xp3K1GxxD8s/k
	zN9QarnBq0EiUjDwmGKqQQs=
X-Google-Smtp-Source: AMsMyM7R9I+UfCMxc5lm9SK0qdovuVrzkym2kERGu1HbuZy+4Zh5yaOnqFlSEsT7ql42XtifELDEKg==
X-Received: by 2002:a17:90a:c38d:b0:203:5db4:577a with SMTP id h13-20020a17090ac38d00b002035db4577amr6042640pjt.69.1663883956166;
        Thu, 22 Sep 2022 14:59:16 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c558:d894:7bf:3842])
        by smtp.gmail.com with ESMTPSA id t14-20020a17090a510e00b002005c3d4d4fsm267398pjh.19.2022.09.22.14.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:59:15 -0700 (PDT)
Date: Thu, 22 Sep 2022 14:59:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 is having trouble with unicode emails
Message-ID: <YyzasbZ80Osek12a@google.com>
References: <YyzPSrTcGliahL+a@google.com>
 <20220922214840.fw7kdyjidsp2g4vi@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220922214840.fw7kdyjidsp2g4vi@meerkat.local>

On Thu, Sep 22, 2022 at 05:48:40PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Sep 22, 2022 at 02:10:34PM -0700, Dmitry Torokhov wrote:
> > Hi Konstantin,
> > 
> > It looks like b4 does not like non-acsii in emails, and fails for emails
> > like "Marek Behún <kabel@kernel.org>":
> 
> It wasn't really the unicode, we just weren't expecting to receive fully
> formatted addresses like that. E.g., this was fine:
> 
>     b4 send --to foo@example.com
> 
> but this wasn't:
> 
>     b4 send --to 'Foo Foo <foo@example.com>'
> 
> The latest master/stable-0.10.y should have handle this properly.

No, if you look closely in my log there were 2 invocations, one with

	--to 'Marek Behún <kabel@kernel.org>'

which dies with UnicodeEncodeError exception, while another, with

	--to='Marek Behun <kabel@kernel.org>'

works properly.

This is with ToT checkout at:

6c215d8 ez: don't send a cover letter for a 1-patch series

Thanks.

-- 
Dmitry
