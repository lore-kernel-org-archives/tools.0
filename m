Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672B568C
	for <tools@linux.kernel.org>; Tue,  6 Dec 2022 21:53:44 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id k2so8663725qkk.7
        for <tools@linux.kernel.org>; Tue, 06 Dec 2022 13:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81I6f0xs5h6IX4WjhoQ0D11guIsPr9rqiMhy3+JHHI0=;
        b=BvhazVTkeoJgwhE4aLfZ8SrXgQuJGP0ILmykttMAK+zO7UjMGOtPSXf0FWNH5Yu4EE
         NpY2WMkJdh9sVuGGvKezST39/h8lRrqrzKW0IHCryv5Thg1zwhz5LKwWe8Uils+qXLxx
         NgTd/D+0hjLpJQI2eriVecWCNMHBuU63XoUg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81I6f0xs5h6IX4WjhoQ0D11guIsPr9rqiMhy3+JHHI0=;
        b=RKU9FZfL7X0uao1psHV6+yXMtggjoKH54ne3tWUrJkghUl13Bmv6WgAmyIf9BjNZhb
         iHTHBD4YBiCDLPcXh5an8udIqprtTq1E8GCQFYLNGKVadBLb22jeDpeDXcxGoGbWeZJ2
         CcqOpUcloVn7NX6ve0u7okO3ulCN6lIbEjdJsFe+k1vqDn/7h4icricnf/Fx2DKj9KGZ
         EFuwG1mT5kUWvRbk+nhQqB2s2QTt23SVtHtBE8cjaHnHTQYKoOlPkHgzFKRk7ibMkfS1
         0oZ4bbbYkhhdqIW3YM7xwc1exX+93GHjrx6BkzZNXcKFlhVyt/KL2vl48FT9/S2adFI3
         cNVw==
X-Gm-Message-State: ANoB5pmTf0oEVhNxdFGSyOmaxcOkdMVHxBNkUKHOQbPfx0IJ5Kqw7BdY
	HQohTTh+qEaWFmV2us5lf7BnhCsEg7Cl/sUC
X-Google-Smtp-Source: AA0mqf5OCCztXvFV97p18zI4USNV0K2uUvaMohsVi4DyLee5bfM7UuveKyv78fEbVPbbJyPOKI8nrQ==
X-Received: by 2002:a05:620a:2603:b0:6fa:17ae:34a8 with SMTP id z3-20020a05620a260300b006fa17ae34a8mr78326118qko.3.1670363622894;
        Tue, 06 Dec 2022 13:53:42 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id d7-20020a05620a240700b006feba101f85sm6536041qkn.13.2022.12.06.13.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 13:53:42 -0800 (PST)
Date: Tue, 6 Dec 2022 16:53:40 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: new: b4 send --reflect
Message-ID: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Final feature before 0.11 (hopefully) -- there is a new test mode for b4 send
that will only email the series to yourself instead of the actual destinations
listed in "To" or "Cc" headers.

This should be particularly useful to anyone using the web submission
endpoint, because this will allow them to see any post-processing that the
remote will do to their patches (such as rewriting From: for DMARC purposes).

If you're using b4 from git, I recommend that you get the latest master so it
can see some testing before the 0.11 release later in the week. 
The main notable new features in 0.11 as compared to 0.10.y are:

- b4 prep --compare-to N: shows a range-diff between your current prep branch
  and the previously submitted revision N

- b4 ty: can be configured to always send mail without requiring the -S switch
  (via setting b4.ty-send-mail=yes)

- b4 send will no longer send the entire series to the addresses found in
  individual commit Cc: trailers; such addresses will only receive the cover
  letter and the patches where they are explicitly Cc'd

- you can now set extra [PATCH] prefixes permanently either via b4 prep
  --set-prefixes or via the cover letter subject line

- internal changes to ensure that we generate 7-bit-clean headers for all
  outgoing mail

- b4 send --reflect: prepares the patches but only sends them to yourself

If all goes well, I will release 0.11 either Thursday or Friday.

Best wishes,
Konstantin
