Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C9ED9
	for <tools@linux.kernel.org>; Fri,  3 Feb 2023 02:58:52 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so3692513pjb.5
        for <tools@linux.kernel.org>; Thu, 02 Feb 2023 18:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fvwa88cziHmTcqE/paRbxAS0sIixsSa/cvHNqjwUoAY=;
        b=ugYDEKLQsbx3VpYnjWhNH/wI9nqjOEQPnp3QmGIu5lAWD2cmz0UM4HpONLySFPPOaJ
         T5CACZ55wgPZt0u+c8uBys7fS134Y3JHoNClkW9LrSoeFkS3uQLhF94EqtTPo+3qTRux
         51YXQ6iRdNOnEVzGDs1P3KBED0JUD33PcywUMLxY9CkG9dYQntwe3z3yIakBQA7ZJr8P
         jWhbo72IxoYURpo2btCggnU5j8f0paf9mO9SxlPB9uH1I7/ct756vdBWpmPdN8ECO+oN
         Nw8IHBJ50nmSvJhDfHT+FOfQBEsndK1YrFloKkPlUFrkzI6gBmeGv2ART8IJgXC44NTe
         mncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fvwa88cziHmTcqE/paRbxAS0sIixsSa/cvHNqjwUoAY=;
        b=wN+AHsdD5dhn50+4iuzH0GHRw3RpTKY/h+A/it2bJyeBSxe98bsWX1y/J58Ma9w6t5
         qehxPzHsI1NFHixz9jAiWbuu2IeCfxG+5LJnCpY/KLJenjHozihcLKJomTNtHs4U70eJ
         k9bAH844Tpov9wfub6FFEHhj7Wd9A9HBx2y5fqpZd8e9qYoUZ2W5P/cuQ0FzQE3cz4IR
         YV8h/uHJBbVAMccfbLUedd9ijd8SCK2Dr5x33atdjdpD7NsrVSCtAfPKNmBJtA1doNU1
         d1vDMz5SCsBbqQGY6/eHNZaJ8YHnzIiNE7wS1B0rHuOfg5XpU4zw+YBN1QHdgl3/x8Oh
         FiOQ==
X-Gm-Message-State: AO0yUKXUiet70GL/LwVY9QdnLHnwjkCxse7YzXMJysJCvfv+oa9F+xmk
	IB0jwiW0YlKU1kFhYLoMIhaynw==
X-Google-Smtp-Source: AK7set9zJzFDU5GShZzH+azWZGnnnSUGDaJuoHbDcchLsMBrL19PI/5+gT1osKGHUCcJW+zM7QPugQ==
X-Received: by 2002:a17:90b:3ece:b0:22c:5241:b8e with SMTP id rm14-20020a17090b3ece00b0022c52410b8emr9559659pjb.25.1675393131401;
        Thu, 02 Feb 2023 18:58:51 -0800 (PST)
Received: from localhost ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090a8e8300b0022c08b63564sm536784pjo.52.2023.02.02.18.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 18:58:50 -0800 (PST)
Date: Thu, 02 Feb 2023 18:58:50 -0800 (PST)
X-Google-Original-Date: Thu, 02 Feb 2023 18:58:47 PST (-0800)
Subject:     Re: [PATCH v2] shazam: Add the --merge-base argument
In-Reply-To: <Y9v9+YC44LXx+nkR@spud>
CC: konstantin@linuxfoundation.org, tools@linux.kernel.org,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-857cb388-0e29-482c-b27b-354aa5e49b40@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 02 Feb 2023 10:16:25 PST (-0800), Conor Dooley wrote:
> On Wed, Feb 01, 2023 at 03:24:05PM -0500, Konstantin Ryabitsev wrote:
>> 
>> On Wed, 01 Feb 2023 17:33:02 +0000, Conor Dooley wrote:
>> > I was just handling a patch set where the author used English to
>> > describe the dependencies.  They hadn't yet been merged at the time the
>> > patch set was posted so I don't think there's really any way to make
>> > sure the computers always understand the base, this just lets me quickly
>> > override the automatic merge base detection when I run into something
>> > non-canonical.
>> > 
>> > [...]
>> 
>> Applied, thanks!
>> 
>> [1/1] shazam: Add the --merge-base argument
>>       commit: 7e797fe9e052bbc97f4ee2cf14b3c444c2d01653
>
> Great, thanks Konstantin!

Ya, thanks for sorting this out guys.  I think I've got a few more 
patches floating around, I haven't poked my tree for a bit.
