Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08B079EF
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 20:09:33 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id m4so5326372qvq.3
        for <tools@linux.kernel.org>; Mon, 27 Feb 2023 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yxYeAANUqTw/amKHtoh5K9A7b1B3WTLdUdOZ1TvXfOY=;
        b=FxVLJddTToPBO0xxC6XqAKmaN5L7eApEkqFpniHoX98VoDsuV5t9mZbHKhomOoJuMX
         g7q77zhpRU0m6aAAwVXKmy3u0910Nh66RPn3WQSMzBFHlPhiWJAl8L2Dh/OBUQtql3oa
         /AH04EpXmx2QAAyFctwz2or7NwkExN8TEGbPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxYeAANUqTw/amKHtoh5K9A7b1B3WTLdUdOZ1TvXfOY=;
        b=NybLiPtG62qXkZhCadDLeI5hFv1zTg0EtomaZcFh4Ukb7I/ApudbVH713yP+cuiLnj
         GIALER54NuWkm1XG1PEy35U/+laZdQCt5SzzChvTxZIJNrrl0cfs9ju/1uO7K7KUEsz8
         mcIXNR8YdnI2V96vewnU393Fn7yS+LQMWK1RrtO4pkrCZKZ8I90fa6qS5vAGHcn0KD7g
         whg2FfvVeix20MgSfb15vhXc8iAIYAamvy3m6uoHhMe8bdc8/yWVgveCSTQ5+IRC76IM
         vuuqj7sAoWnDu25qGfupHcdCp7VkIzSoJjpoTlyTqVu8fmJ5bJTxHBQZvdKAvPLwWlKT
         mqSA==
X-Gm-Message-State: AO0yUKXaYLRu8OrWyo7/db6sUQ1dK+GbciQPOP5ACr+UxciGv0um1l/K
	4zDHclAvovQum+kAXq3vXEoKv++q/BZ9Cj1t
X-Google-Smtp-Source: AK7set+x14M9qlM+K4TfEk38oC7m6MAaeuYURSO6f0VLuwt1Qw1PSuqoo4iJTqmFa2OAGBujzw8i/g==
X-Received: by 2002:a05:6214:29ce:b0:56e:bd59:40f1 with SMTP id gh14-20020a05621429ce00b0056ebd5940f1mr786946qvb.48.1677528572644;
        Mon, 27 Feb 2023 12:09:32 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id t128-20020ae9df86000000b0073d7e81f8b5sm5475850qkf.35.2023.02.27.12.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 12:09:32 -0800 (PST)
Date: Mon, 27 Feb 2023 15:09:30 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] shazam: Add the --add-message-id argument
Message-ID: <20230227200930.qdynviatehu5i4br@meerkat.local>
References: <20230227190348.wbvqvpduk74x5yy4@meerkat.local>
 <mhng-3ce78a47-f2c4-40a1-86fa-7339531c2250@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mhng-3ce78a47-f2c4-40a1-86fa-7339531c2250@palmer-ri-x1c9a>

On Mon, Feb 27, 2023 at 11:05:19AM -0800, Palmer Dabbelt wrote:
> > Yes, and you can also add it to wtglobs in get_main_config() in init.py, which
> > should allow setting this in .b4-config for projects that want to add that to
> > their toplevel.
> > 
> > Do you feel like doing a v2 with this change?
> 
> Sure, but if someone else wants to take a whack then I'll be more than happy
> as it'll likely happen after the Linux merge window, QEMU soft freeze, and
> GCC branch...

I can make this change -- should be straightforward. Thanks for the
suggestion.

-K
