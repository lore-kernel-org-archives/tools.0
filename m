Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1E32590
	for <tools@linux.kernel.org>; Tue, 26 Jul 2022 14:27:45 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id c20so10522999qtw.8
        for <tools@linux.kernel.org>; Tue, 26 Jul 2022 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ORv65/gf0wDH0iEV5xq93chyoa60oMkCzELc5dz58n8=;
        b=I5yI87APL4Z6OV1bsNiKL3OT0fAXxtQvF4nJM0KAWc9qFSZSnAJfxkkTTx+ohDoy7n
         IDdYkhE2S50e7ofgINuJd8qPZL/bgFRN8Q4KDHRcqqRzwmX0NfPEdGv0tq6TxSolIv+l
         cTdknOWWkbwHqNiv9rTZ4DQ0/UMrEdMe5oOLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ORv65/gf0wDH0iEV5xq93chyoa60oMkCzELc5dz58n8=;
        b=nkaCMr9WST8RckhBNP1wERjWukzTGqqMBBMxqN3WwlSRv9ZHOxWf/jzssj8o7O48YM
         n/tv4H+f9+bxKW25C3GKOqxtjTJEaL/Ej5duf7TfXho38Cj7H4t43ZASIC3GDvzOL+1y
         c8j3laAZE2FCvE3qP19iTAL6nKrOn5uN55NzhLArKY/quDvD/iVXIlIL3G5nZe/jPfhJ
         T55XJx1Hg/CgQotuN3OQITWSUmaZopeApsLNlE0eTgqP6gjKfrfNCHdGJDFXhsJxdqVq
         UTS9q1dAP5Jsq1cGvD6DQsWpbPhInShJbr5u2EP/njsAxlQ1MfaKU5PGvVh9awskvbj4
         cKPg==
X-Gm-Message-State: AJIora/kSzPdm61ErG4Eyfc9kSTc5WKoVCPGkegOybpjEdzz+jkF3+Y8
	MYYVps/r3oXKNwWSL2LuI7wDmQ==
X-Google-Smtp-Source: AGRyM1sZ45R3YSIts+6ayvv5hiqX1SAwWsmIvkRrYardpR06aY884pb2JYGGWdlJmCYxxmq8q2DSZQ==
X-Received: by 2002:a05:622a:1106:b0:31e:e946:d6a8 with SMTP id e6-20020a05622a110600b0031ee946d6a8mr15096473qty.621.1658845664842;
        Tue, 26 Jul 2022 07:27:44 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id h19-20020a05622a171300b0031ef6a420d6sm9807831qtk.35.2022.07.26.07.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:27:44 -0700 (PDT)
Date: Tue, 26 Jul 2022 10:27:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220726142743.dllhmbivtb2yk4uk@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <87pmhs1d8h.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pmhs1d8h.fsf@baylibre.com>

On Tue, Jul 26, 2022 at 10:37:18AM +0200, Mattijs Korpershoek wrote:
> > 2. "b4 submit" command got split into 3 different commands:
> 
> While I do agree that these commands make life easier, I don't think
> that we should "ez-" as a prefix.
> 
> The "ez-" part has, in my opinion, no added value for users. It
> assumes that using these commands is so easy that "you can't use it,
> you're really incompetent". I think we should use more "neutral" langage
> for commands (without judging if it's easy or difficult).

Yeah, ez- is a gimmick and may not stay. It's easy to type and tab-complete,
though, which is why I went with that (not that tab completion bits are done
for b4 yet).

> How about:
> - b4 series (for creating/handling series. Also includes "send"/"submit")

I think that makes it hard to distinguish from "b4 am/shazam" that also
operate on series. In my mind, the command should indicate that it's
specifically for working on series for submitting them upstream as opposed to
for retrieving series for inclusion into your repos.

Perhaps "b4 prep"?

> - b4 trailers (for handling trailer updates)

Okay, since one of the plans is to add a way for maintainers to quickly send
their own follow-up trailers, e.g.:

    b4 trailers --ack [--trailer 'My-Trailer: Foo Bar <eml@addr.foo>'] <msgid>

this would allow defining keybindings in mutt to quickly submit an "Acked-by"
or any other trailer.

> >         b4 ez-send --no-auto-to-cc --dry-run
> 
> In my opinion, "b4 send" should be part of series because we cannot send
> series that were not created with "b4 series".

It won't be limited to just series, though -- you'll soon be able to send pull
requests as well, and that will accept arbitrary tags. So, I intend to keep it
separate from "prep".

Thanks for your feedback!

-K
