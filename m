Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.120])
 by mx.groups.io with SMTP id smtpd.web10.1249.1588156345849702434
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 03:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vv9trUX2;
 spf=pass (domain: redhat.com, ip: 207.211.31.120, mailfrom: pbonzini@redhat.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588156345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgItbxUhqAwSCQzRYeXjmpiKGCR4GOZcRDZcQXcOOMw=;
	b=Vv9trUX2XK1mSeWfD97GRKh7s5oI1DEZRmEvWCtjN+5317alf1FV7bbZtsvCc/uJMlBzwH
	Fvp8jxa7SQ1DrSLOuWUpxtYRIwQ+cKvgwSaQQRckIijVj/PE5NBSShKFLWQ3uXFc8FgSHQ
	cR2GrA3IoIysbWBl6xgZTwcO/fGrAgU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-umm9m7t_Og6Iqy2eFR19Gg-1; Wed, 29 Apr 2020 06:32:21 -0400
X-MC-Unique: umm9m7t_Og6Iqy2eFR19Gg-1
Received: by mail-wr1-f72.google.com with SMTP id o8so1493961wrm.11
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 03:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VgItbxUhqAwSCQzRYeXjmpiKGCR4GOZcRDZcQXcOOMw=;
        b=RCbWndfS/rv8pnEIYqgtx1wF+Ssu55BEqIY8PNzGbjdgws3jDDsAYbRoGBmOGK3zpV
         5/a4KKmHdzwmrjoaqnNqUDqGVm/9ZGqlUX1DI1FyenUPKfYOWo4ndAjke/4/ks4UVpUk
         7EMoch2DksxigXxmcUn40i7UMXBkM8qiZpEruT7pJgCfWEV7rwQKleZonDXFCCasEGTe
         68J+PdH5q24Rf6ZPBV+HC4XPWIWR61a7p2GgAEe15FGM69GbM0YgRrPtdAXPtWGB6hUn
         Lcfjk9aFLUkg5z2M0JslDB+YGWgPchyboqutobZ+YBoFpVN5gNCc+yKMGJuJyhSVXSj/
         ZeBw==
X-Gm-Message-State: AGi0PuY0IhAc8VaLmGb59Zm8urL8YXcFa6I78RMwTEIHcl+Qf95GfS6t
	2TwNkSBQ1NJyUaqtqnenL7jz1ADjJwcraHK6RLaY93hgnwqkfLMfmDMzdO1gWbLREIYzkr/KRdk
	lQUEP3ZX3xYxzMVWV
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr39101843wrl.308.1588156340240;
        Wed, 29 Apr 2020 03:32:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwrMQpBo+F9dIvuVydrwmdJzUkBGqG2983DLTLSsb8YFKK/Lbx0GXTppEgHy6c467IgiWSNw==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr39101807wrl.308.1588156339813;
        Wed, 29 Apr 2020 03:32:19 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.150] ([93.56.170.5])
        by smtp.gmail.com with ESMTPSA id i25sm6997116wml.43.2020.04.29.03.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 03:32:19 -0700 (PDT)
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
To: Michael Ellerman <mpe@ellerman.id.au>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <87sggnexjq.fsf@mpe.ellerman.id.au>
From: "Paolo Bonzini" <pbonzini@redhat.com>
Message-ID: <da03b84c-e7f3-b71d-ddd4-a06b0b787b6e@redhat.com>
Date: Wed, 29 Apr 2020 12:32:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87sggnexjq.fsf@mpe.ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 29/04/20 06:16, Michael Ellerman wrote:
> 
> What would be a useful way to quickly do a "show me what changed" 
> between two versions of the same patch series? Especially considering 
> that:
> 
> - there may be a different number of patches in the series
> - new revisions will likely be based on newer trees
> - subjects/commit messages/trailers may be vastly different between two 
>   series, even if the code is very similar (e.g. someone broke down a 
>   single large commit into several smaller ones or vice-versa)
> 
> In my mind, the best way to approach this would be:
> 
> 1. Create a single unified diff file from all patches in each series 
>    (using combinediff)
> 2. Remove all context, leaving only -/+ lines (using interdiff -U0)
> 3. Remove all line numbers from @@ @@ hunks (replacing them with 0)
> 4. Add commit information on top of the diff

You have to do what "git range-diff" does:

- Remove all line numbers from @@ @@ lines

- Remove commit message too if you want, though that's not strictly necessary
(sometimes small patches can change a lot but commit messages stay the same)

- Add dummy empty patches to the shorter series to detect new or deleted patches

- Compute diff of all pairs of diffs (this can be optimized by looking in advance
for completely equal patches - maybe removing the commit message would help for
finding equal patches)

- Compute a "weight" that measures how different the patches are (for example, number
of lines removed + number of lines inserted)

- Solve an assignment problem using the Hungarian algorithm

- Figure out the order in which to present patches (e.g. sort them 
according to the new series, including deleted patches from the previous 
version after all the patches that came before it).


You can find an implementation in Javascript of the last five steps at

https://github.com/patchew-project/patchew/blob/master/www/templates/series-diff.html

with the Hungarian algorithm at

https://github.com/patchew-project/patchew/blob/master/static/jsdifflib/munkres.js

(but there are Python implementations available in PyPI too).

Thanks,

Paolo

