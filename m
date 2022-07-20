Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5657B
	for <tools@linux.kernel.org>; Wed, 20 Jul 2022 19:24:59 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id h22so14120145qta.3
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 12:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J/6E5wUqDwWRLwWe1jJxNjJow1MZswr5nfdjY7Eksk4=;
        b=b699zNJv6RzwRPJqX2y51nPntKhQ7PhU1t3GAvE79FZOIhIYpKsIglwQRF79B4RsTE
         5xyQp33T9V9T5nJAPqZoWEh/rrC+HnXLsv9NXztNKATXrGmHKWUkrNbOHDldywHxMh4B
         jJNwcXLgUxcroewN2Li+fPUqcL5z+q4AkSRUbnmeP3CosfjQAsayxBSqszsIT8zl008m
         bv29IwQFaVI0F/rkSEAg5QT8tpKQh3OU0TPkZ8nLW6W9V7TN/svfUgJeqFWBBlHXjXAC
         Uz67n8olErBjjQHz44xp1hrRIBQiLwwKwCWRyWI3ItBvvzDviHWK/DPhwqipZWRqHIbp
         olag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J/6E5wUqDwWRLwWe1jJxNjJow1MZswr5nfdjY7Eksk4=;
        b=rn9lXTAGkGrysbebWWj61yETiHIm6Pz+YzsKGEuFAHiZ+WSHvPoGZTF1ENsfCG4nvj
         N11OiIVqlT1qmL2EdeK0Rd/gP2qnNsQP+9xju5mxdHPYfZRkEyteAxwB8hMhgfjTXP9I
         BSr9NLKvjzImoTSsziBzZ4DC9PfdPFpVQG+pWvfeiXMSSbPvocw1V7wzXbmk7Un6O9EZ
         lMGupMrMdYAuo0RBlYapVAzpvCgKHadz77cH/A43IXw1Nh0hNK9jl6DDc3pUWGygciZM
         ibEgWKvjgNu0UR9UO/F9xtsHttx0latuj/8CJz4jH3eynxnHBVPUpLe4s8EJBZNwvKKY
         Z0tA==
X-Gm-Message-State: AJIora/tTDBVmzh5jGuu2gLZodGwpPHy6zR+svijm55JaPMgX22xaAWn
	qQA/Vu2hCGBODFVYd1s5q6sZPQ==
X-Google-Smtp-Source: AGRyM1u7a/XlMRLKhEEQmLJ6TeyQnj6ZxSb87NSfr7yG2/0cBFHmRK82ztJ8RDkG5IWZ5/KUWNkeRw==
X-Received: by 2002:ac8:5c45:0:b0:31e:eee2:d64a with SMTP id j5-20020ac85c45000000b0031eeee2d64amr10720556qtj.179.1658345098157;
        Wed, 20 Jul 2022 12:24:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id do16-20020a05620a2b1000b006b5ab88e544sm17534703qkb.124.2022.07.20.12.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:24:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oEFJY-001exe-A3; Wed, 20 Jul 2022 16:24:56 -0300
Date: Wed, 20 Jul 2022 16:24:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220720192456.GM5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720184835.uhnkucai54alhgo6@nitro.local>

On Wed, Jul 20, 2022 at 02:48:35PM -0400, Konstantin Ryabitsev wrote:
> Hello, all:
> 
> Based on your feedback, I've refactored the submit functionality and it's
> ready for some more poking and testing. Here are the implemented changes:
> 
> 1. Pluggable cover letter strategies
>    The goal is to support 3 different cover-letter strategies:
> 
>    "commit": same as first implementation with the cover letter stored in an
>    empty commit at the beginning of the series.

How about an 'end of the series' option if we are doing lots of
choices?

I've never actually seen 'start of the series' in the wild before..

Jason
