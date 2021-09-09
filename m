Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB213FC8
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 12:31:53 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id d11so1206608qtw.3
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5ngMoFNrwyDkvmp9myTgXBG/MkbAcFIEoETsidI8kpI=;
        b=W5MR2JJ3MH4ds0AxduEMPvE8FGb4Ypag6zB8xTuuvC/+mWjHGMOwNdrLNI6NBW5IH5
         EZe3V+IhDDB7QObxxQdIC8kyX+rbnSCrsJNzn21oTOx4J7U5VVFfPzEDg9sfuUkGl4Xu
         ufJkwD1P/8R431xv9dDI1lYI7Kszwqlq0IoL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5ngMoFNrwyDkvmp9myTgXBG/MkbAcFIEoETsidI8kpI=;
        b=SlNjZU6QSwXN7gSKQja6gxmJ7yJjxlTFC1XoHK+seQptXRAYOj0ZKxdVzBeG/r5Ms6
         6WRigHEheAYxJnYOJv1yNIKLAUkMuXIhD1lPXVSY/im23j6oXSTwcMQch1p76k3axoB6
         DzsKiJiPoZ48mXKkAySJO2ZUYFJpV2rpR+rBuURQIlay89YGj8Lz74i1R5DCzAFQWE5o
         x+O3e0+gjGnATPb5i3GjOUhdfQ8IyKtPd1vQMkPZf7+1UgqK6IyZ7LcWjPZq6cHblUp+
         96eDAIsuNBCSqdXI7Nl88WRvCKwhsmDKWvzlnYzhpr4yjF7C2hqoOW4mzfhSNUqPrtwK
         8mtA==
X-Gm-Message-State: AOAM532blzzrcAv4JSUsgBx2dK32qlkS+4FcgWE6OEmMDa/PO2fzEcQC
	dWSlCI1WIrWgqs9UvfHDfVa8SA==
X-Google-Smtp-Source: ABdhPJzzq/8GlAVUZdmUZ1RJPesBAEo7hSpIbYHbq87P3V7zKrw0RCLFnU1UB9FbfVH+ECfHep48+w==
X-Received: by 2002:ac8:7d4e:: with SMTP id h14mr2514081qtb.404.1631190712342;
        Thu, 09 Sep 2021 05:31:52 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id n5sm1007520qtp.35.2021.09.09.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:31:51 -0700 (PDT)
Date: Thu, 9 Sep 2021 08:31:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: David Howells <dhowells@redhat.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210909123150.fgo7vma4i32t36mg@meerkat.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <398626.1631181532@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <398626.1631181532@warthog.procyon.org.uk>

On Thu, Sep 09, 2021 at 10:58:52AM +0100, David Howells wrote:
> Would it be possible to get a search box on the front page into which you can
> just drop a message ID and have it jump to the message, if present, kind of
> like lore.kernel.org/r/<msg-id> does?

You can make it even easier.

In Firefox:

    * open bookmarks pane (Ctrl-b)
    * right-click->add bookmark
    * Name: lore mid, URL: https://lore.kernel.org/%s, Keyword: lore -> Save

In Chrome:

    * Go to chrome://settings/searchEngines
    * Click "Add" next to "Other search engines"
    * Search engine: lore mid, Keyword: lore, URL: https://lore.kernel.org/%s -> Add

Now you can type "lore <message-id>" in the toolbar.

-K
