Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE67F2FB1
	for <tools@linux.kernel.org>; Wed, 26 May 2021 20:52:33 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id q10so2515975qkc.5
        for <tools@linux.kernel.org>; Wed, 26 May 2021 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tDhw09MQm5bH9RhpJoL4itoP9f0I+jlcZ1azTxhZLY4=;
        b=oOpQIyjuPsy7+8ngIGxiU5IggxruDi99OjfhbPBoaibsjmMk+bjbsp+KkzOjYh4twr
         /LReJYI9xS/Mil0LKIkGR7ds+FNPT32sjl3PczaYcLoq5p9zCYj27HzffQp60D9xodfj
         HnODimH3v7Y6/IuczGiZBClat0oookh1wrGOXGmdEPfVbTUrmX2kU6f88mwgBv7dHTN4
         gdeBvmC7SZfoF7Ultq48+ZNkmSh4IT4TfI/a4D9qVIaXM4ADI3ndf/R/FZow2NbRo+RC
         DNxEXw9llrEGfrk20Vm89AgML/SFkSJr8KjJmN7TvapHQdd8aWLvO5anBnpHXKVyBFK9
         Ou8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tDhw09MQm5bH9RhpJoL4itoP9f0I+jlcZ1azTxhZLY4=;
        b=R+eO5vEBSEUke9bybkR4zWx9CKxCOnc2iymdHm4l4YUikOvldWexcU9OJNt2bXqkKd
         SbUAQSx1ubNqPdPm0sFPbv3nIT9ZwtNFY1jORvxi4aTaAcIeOWnsENaMLEmRypIUPfOg
         tsefw6MM1xvIeS4K8u/MNnRzj4HclVzaxuxM1TQ+X+jcU0X7Upc6yBR0ZJdPSfC7hSjg
         3XmzpTSNXfbOsBJQJX50hHjIwNRtim/RF8at9rlCx16oKp0pRbprlOkrs8NA6qRE8oMx
         vjQJ8WvdKjnE9qt9mMoU9S7t94jbYfFG+eO5fQsuw+1nrooT9cT7qgtxaDXkDEQXHeMK
         jtyw==
X-Gm-Message-State: AOAM531LB3TAT4mD39Js1zF0yEuKLKhmWYxooCFEvDcLOozkvk8cDDln
	JkcG8vW0CnorR/PCakb+Zq784A==
X-Google-Smtp-Source: ABdhPJxvqVcYmSeirHK4RmgzBWtODwKxeUPzeRUWczjSoGJaFBPPQwCNg5CLwCom3+tSwBVo1xa+/w==
X-Received: by 2002:a37:917:: with SMTP id 23mr38903qkj.26.1622062352989;
        Wed, 26 May 2021 13:52:32 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id d1sm85712qti.72.2021.05.26.13.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 13:52:30 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1lm0Vx-00FKs9-D2; Wed, 26 May 2021 17:52:29 -0300
Date: Wed, 26 May 2021 17:52:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.7.0 is available
Message-ID: <20210526205229.GG1096940@ziepe.ca>
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
 <20210526194117.GF1096940@ziepe.ca>
 <20210526195642.h4yzvykpopuckffz@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526195642.h4yzvykpopuckffz@nitro.local>

On Wed, May 26, 2021 at 03:56:42PM -0400, Konstantin Ryabitsev wrote:

> We already do use patchwork-style patch hashes in b4, so perhaps a better
> approach would be to closer integrate b4 with patchwork -- if simply on the
> level of:

It would be a nice feature for b4 to be able to fetch "from"
patchworks, for instance

 $ b4 am https://patchwork.kernel.org/project/linux-rdma/list/?series=487923

"from" means b4 would go out and query patchworks for the list of
message IDs that constitute series 487923 and then b4 fetch exactly
those IDs in the usual way.

I have a script already that does the patchworks side of the above
using it's JSON API so it isn't too difficult

Jason
