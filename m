Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8E610E
	for <tools@linux.kernel.org>; Thu,  8 Sep 2022 20:39:17 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id z18so1827409qts.7
        for <tools@linux.kernel.org>; Thu, 08 Sep 2022 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=6yRGoqlp36QS72qa9SZIlWIBWAri9ig4/7C3Khmiy0o=;
        b=YtG0OB7xNhjjfVnfzuMA35KN563TB5LvXEbcoQSQDnH0cJcJnf1ANeIFWTyQfjbFCz
         Xy0dNc2lWEcPM8j8v/8ghRMxUtVUSXs1beUcvU668F/8f02mxU7gt5DHQt3hci6URv/u
         ZqYPORYKmVyseb/RrQ7wvtwFoCy2/7z2wGilw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6yRGoqlp36QS72qa9SZIlWIBWAri9ig4/7C3Khmiy0o=;
        b=w1EE44ASxs7DLSE7hXerE5RpWuH5Keke4EPLegG/MkVEEks+hsBPEaNauUDb3r5C+M
         ohVbh6snC3IjPpzvA/xEAK4E/HI1jgftNBCJXx41YYJtNe+Y6bNOVqhi12NkgFVaWj6W
         u6L2IPXmGDml32tzHuvzy1Yq0KkdvGfU8sOzscJ6sSVgOtks1n65+GrtTbknUB/6oYV0
         +sxS6axG3rTFauk1wI6pi+/YBg8nD5Y3H8MnesFYxeQvH3iHJ6+vSuznjtSzbCLnVljs
         wmKg6p4oTNnLkeXpYeapy9jY7tIjgnLxV92mgT38iICJpb49u3skDWlQUAr7cBa0EIoy
         GnoA==
X-Gm-Message-State: ACgBeo30Iwc+JcZUDL9KbZ2JhHw1HqOFOKD8n2KtlIHdC6HaaC3AevTm
	pugKPWGNxixDundQagcdUzB1xg==
X-Google-Smtp-Source: AA6agR5bloiKdVXZyVkjH3hTrzE8jFrbVRN5rNf+837KRbB/01YZ+tgv8+qN7WnDbs8oF37g4lssPA==
X-Received: by 2002:ac8:7d4a:0:b0:344:6f12:1543 with SMTP id h10-20020ac87d4a000000b003446f121543mr9657630qtb.426.1662669556104;
        Thu, 08 Sep 2022 13:39:16 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id u11-20020a37ab0b000000b006cc190f627bsm395563qke.63.2022.09.08.13.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:39:15 -0700 (PDT)
Date: Thu, 8 Sep 2022 16:39:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tools@linux.kernel.org
Subject: Re: Couple of bugs(?) in b4 send
Message-ID: <20220908203914.yxgmjm5tsk7jvfoh@meerkat.local>
References: <20220908201359.tlm3tlykpsm5j3iu@ldmartin-desk2.lan>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908201359.tlm3tlykpsm5j3iu@ldmartin-desk2.lan>

On Thu, Sep 08, 2022 at 01:13:59PM -0700, Lucas De Marchi wrote:
> Trying the new b4 prep/send commands. I used some patches I had and
> just created a new series. Some hiccups:
> 
> 1) --to/--cc don't understand aliases
> 
> I use sendemail.aliasesfile in my git config to point to
> ~/.config/neomutt/aliases. When I try

I'd say this is a feature, as aliases may be defined in any number of ways and
I'm not sure we should try to locate all possible places where this may be set.

The idea is that people wouldn't really use it via cli, but via
b4.send-series-to and b4.send-series-cc, e.g. for a project like git, you'd
define:

    [b4]
      send-series-to = git@vger.kernel.org

I'm thinking of automatically including git-topdir/.b4-config when found, so
repos using b4 to send/retrieve patches can predefine a bunch of b4 settings
relevant to their project.

> 2) --no-auto-to-cc either does too much or too little
> 
> I want to Cc people who previously reviewed the patch or who are
> explicitely added in Cc in the body of the commit message, i.e. I don't
> want --suppress-cc to be given to git-send-email. However I also don't
> want the get_maintainer.pl to be invoked since I already reviewed the
> list of people I want to send the email to.
> 
> If I pass --no-auto-to-cc nobody is included and if I don't,
> get_maintainer.pl is called and a lot of people added to the list.

You are right -- the current setting is mostly for myself to avoid spamming
the world with fake patch series. :)

How about:

    --no-auto-cc  : skips adding addresses found in trailers
    --no-tocc-cmd : skips executing tocmd/cccmd (get_maintainer.pl, if found)

-K
