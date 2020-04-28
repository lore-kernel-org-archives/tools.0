Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.198.1588089795034774332
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 09:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=LUgtxXjM;
 spf=pass (domain: ziepe.ca, ip: 209.85.222.177, mailfrom: jgg@ziepe.ca)
Received: by mail-qk1-f177.google.com with SMTP id h124so5129704qke.11
        for <tools@linux.kernel.org>; Tue, 28 Apr 2020 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GfTRjeVZce454njzI8AXMo2PLpNBsWRFZiGPdoG649g=;
        b=LUgtxXjM+UB8RwEGUgaGZZWYDp2nlrGFISQ9pXN4BUKCwcGXFJLbZobGoEje9S6l5/
         MLP137KUPi7TxrxaGsaAGWfjUXwvtDQGv75qG6sWdn4GSDp6ki3xeOSKiBx+gymlRURt
         MBd7nygfN9ljrQ+Jgx9QKxFLrFGVqGdhA/RnR8dpXLOk5Ih3rcuTWLF0NefrELREeMON
         oBfShZr3LxUGl/uRTaY8sEgOueXnWQYkony30ANvPREyTOYCi3opv7kamw7twKZZP1mX
         mDDxAKX2bv2COf9VGEPIyR9mv2DTnAta4Z019/VOEwJ1i9nJk7OThVUzMapKvp32TRo+
         9F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GfTRjeVZce454njzI8AXMo2PLpNBsWRFZiGPdoG649g=;
        b=lyWIpxWggk4fQqrPnvtQCKDT+RfGUlPLxZJyWAJSRdlTGB2Z8DUGyhtcPgGZgPvLKb
         kYUCmIsiFDJHXlM+7zgrF3l95s3Z42lC/7Trc5oB0r9/R+wG1q71Goi/OKiO8TggzlPl
         i85a9/keJwJwifttSBLRCqSJJj0JI2w5AC9DNCq2P0yXgKYkvhLUNRmlIK7Dm6TgOBXM
         NrDvaZ6m7hsSz4C2VWUqkq3HF8LeNXrvuZPK2VawOKaIYr4WwSFJ47NQ53jU4Gx6V8fN
         f3wbBreXdPtincWhUiaEp/bHYuy0zEldqIl9d7p4fJt8Uuv2N3jsxfCTQ6rruXC2UHgo
         dHRg==
X-Gm-Message-State: AGi0PuYC9QlniFpugHaH6uNttXxWsxDAUfhq1mIPrrlAMNJpDZMmf2d+
	fIYJmEQXDu1hMg4FXvflgNSFDg==
X-Google-Smtp-Source: APiQypKh7byMNAIAhGD5aeVOhrLQi9CaE3JoNgrKGR9UEYIj2ffSV6Sap2BLi5+hYndRbFxUAD5yhQ==
X-Received: by 2002:a37:a2d8:: with SMTP id l207mr27522528qke.6.1588089792951;
        Tue, 28 Apr 2020 09:03:12 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id 10sm15309850qtp.4.2020.04.28.09.03.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 09:03:11 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jTShS-0002yv-S6; Tue, 28 Apr 2020 13:03:10 -0300
Date: Tue, 28 Apr 2020 13:03:10 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] [tools] b4 v0.4.0 available with new features
Message-ID: <20200428160310.GU26002@ziepe.ca>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <yq1lfmkbgoi.fsf@oracle.com>
 <20200427184051.ol7znhab6khqvjas@chatter.i7.local>
 <yq11ro89x54.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq11ro89x54.fsf@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2020 at 10:12:07PM -0400, Martin K. Petersen wrote:

> It would also be great for the matching to be more forgiving (capturing
> per-patch message-id and matching with Link: tag, for instance). 

+1 on using the link tag it should be a uuid for the original message
to reply to

Jason
