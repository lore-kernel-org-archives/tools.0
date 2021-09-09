Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBE3FF0
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 16:17:46 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id t35so1896261qtc.6
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eioYYU79If2337eiPc7lFul6Lf6KfZyxw1u/HALaW7Y=;
        b=EipV+lEgd5pIQwXxxKegk6LjVPEKibfRHKC+yxBbuN1hh8EVheMtB8P1538I05UhVC
         riiIyhdC1fj3uBLIrrUQHcu9x+YxCvhio+i0jsgbNpR3LywpqsdFO03q0xqoSNpTz65J
         lqzaO9UUi0t3tRymXHrgOnGPdoavfi1oKai5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eioYYU79If2337eiPc7lFul6Lf6KfZyxw1u/HALaW7Y=;
        b=kT3LB5jXnli3xfF1ocYK9+EWAbENu243q/wu4+1xwZTbzetIja9xeZvvmx95dwJOy5
         6bWyEo+9bH6D1+6aamhqP3jKYm9gJTQLsJGW9kqZxvTTg1guXWNmi3gCWkZ5CiW18HWP
         ljLii5JDOy2N/cpr0fJCnYNtqErWv1lAYhESnZbW2r+EAAGPG4bBIDlmFZMNWfYOhbtq
         wAVh/a6BU+bLajRYUkRY8x6S2xBYDFDwgw7UonAQqJsXcP3MHgiSvoI7fw2+SESjYGPn
         o0KDeYP4nUPqPD0DBSK9+oxqlv8PJ+2iwdzt11USPXD6+AzC+J6QmuYYMgLpRErwTJNi
         A4OA==
X-Gm-Message-State: AOAM533oJqpfBLUUJLGQyFs2onxBsIqqHQnzhu9sXS2FhNJBLM6M7Pq4
	pb5WCEjSAfDloM8rucJh8JkF4g==
X-Google-Smtp-Source: ABdhPJwe32IUDqwlTBfk0+qjnfIaBw5fgEG7+TnH3y+8vIthflEQivQjdMEtOcYv19Wvmrsa+IRexg==
X-Received: by 2002:ac8:574b:: with SMTP id 11mr3659810qtx.342.1631204265142;
        Thu, 09 Sep 2021 09:17:45 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id f29sm1366419qtv.34.2021.09.09.09.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 09:17:44 -0700 (PDT)
Date: Thu, 9 Sep 2021 12:17:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Lee Jones <lee.jones@linaro.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210909161742.np2r65leas5fqtqr@meerkat.local>
References: <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <20210909133840.hezwxmojt4o6lm7o@meerkat.local>
 <YToQEQPcjU5RUww7@google.com>
 <20210909143937.jgppakjxcig7dug6@meerkat.local>
 <dc02087e09203a03c54c51dd3bfb09deb3cd9077.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc02087e09203a03c54c51dd3bfb09deb3cd9077.camel@HansenPartnership.com>

On Thu, Sep 09, 2021 at 08:24:28AM -0700, James Bottomley wrote:
> > No worries, and like I said -- if you actually need patchwork for
> > tracking state, then we'll be adding a way to create search-based
> > projects in the near future.
> 
> I thought public inbox had a mechanism for tracking local state: the
> most pressing being whether you've read the message or not when you use
> imap backed by public inbox.  Can't this local tracking be extended to
> do other useful things patchwork previously did?

Pretty sure that's not currently the case -- public-inbox-imapd provides
readonly access and does no state tracking.

That's not to be confused with the new "lei" command provided by public-inbox
that can collect threads from local and remote sources and make them available
either as local maildirs or upload them to an imap folder. The "lei" interface
is still being finalized, so I don't want to over-advertise it yet until the
dust settles. Once completed, it should allow anyone to "receive" mail based
on custom queries straight from lore or other public-inbox or imap sources.

-K
